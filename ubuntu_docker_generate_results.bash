#!/usr/bin/env bash
# Setup noble with proper tools

tmpfile=$(mktemp ub-docker-script.XXXXXX)
exec 3>"$tmpfile"

cat >&3 <<EOL
#!/usr/bin/env bash
set -x
set -e
apt -qq update > /tmp/update.txt 2>&1
apt -qq -o Dpkg::Use-Pty=0 install adduser clang clang-tidy cmake cppcheck g++ parallel perl python3 valgrind -y > /tmp/install.txt 2>&1
deluser --remove-home ubuntu
adduser  --disabled-password --uid $(id -u) --gecos "" $(whoami) > /tmp/add_user.txt 2>&1
if [[ \$* == *--interactive* ]]; then
  usermod -aG sudo $(whoami)
  apt -qq -o Dpkg::Use-Pty=0 install man sudo vim -y >> /tmp/install.txt 2>&1
fi
mkdir /home/$(whoami)/.parallel
touch /home/$(whoami)/.parallel/will-cite
mkdir /home/$(whoami)/.parallel/semaphores
chown -R $(whoami):$(whoami) /home/$(whoami)/.parallel
if [[ \$* != *--interactive* ]]; then
  su - $(whoami) -c 'cd $(pwd) && ./generate_results.bash'
else
  su - $(whoami) -c "cd $(pwd)"
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
  ubuntu:noble-20240605 \
  /bin/bash -x $(pwd)/"$tmpfile" $INNER_FLAG
rm "$tmpfile"

