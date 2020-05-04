#!/usr/bin/env bash
# Setup bionic with proper tools

tmpfile=$(mktemp ub-docker-script.XXXXXX)
exec 3>"$tmpfile"

cat >&3 <<EOL
#!/usr/bin/env bash
set -x
set -e
adduser  --disabled-password --uid $(id -u) --gecos "" $(whoami) > /tmp/add_user.txt 2>&1
apt -qq update > /tmp/update.txt 2>&1
apt -qq -o Dpkg::Use-Pty=0 install clang clang-tidy cmake cppcheck g++ parallel python3 valgrind -y > /tmp/install.txt 2>&1
if [[ \$* == *--interactive* ]]; then
  usermod -aG sudo $(whoami)
  apt -qq -o Dpkg::Use-Pty=0 install man sudo vim -y >> /tmp/install.txt 2>&1
fi
mkdir /home/$(whoami)/.parallel
touch /home/$(whoami)/.parallel/will-cite
mkdir /home/$(whoami)/.parallel/semaphores
chown -R $(whoami):$(whoami) /home/$(whoami)/.parallel
su - $(whoami)
cd $(pwd)
if [[ \$* != *--interactive* ]]; then
  ./generate_results.bash
fi
EOL

cat "$tmpfile"
chmod +x "$tmpfile"

if [[ $* == *--interactive* ]]; then
  INNER_FLAG=--interactive
  DOCKER_FLAG=-it
fi

docker run \
  $DOCKER_FLAG \
  --rm \
  --cap-add SYS_PTRACE \
  --mount type=bind,source=$(pwd),target=$(pwd) \
  ubuntu:focal-20200423 \
  /bin/bash -x $(pwd)/"$tmpfile" $INNER_FLAG
rm "$tmpfile"

