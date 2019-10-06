#!/usr/bin/env bash
# Setup bionic with proper tools

docker pull ubuntu:eoan-20190813

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
  ubuntu:bionic-20180821 \
  /bin/bash -x $(pwd)/"$tmpfile" $INNER_FLAG
rm "$tmpfile"

