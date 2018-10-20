#!/usr/bin/env bash
# Setup bionic with proper tools

docker pull ubuntu:bionic-20180821

tmpfile=$(mktemp ub-docker-script.XXXXXX)
exec 3>"$tmpfile"

cat >&3 <<EOL
#!/usr/bin/env bash
adduser  --disabled-password --uid $(id -u) --gecos "" $(whoami)
apt -qq update
apt -qq -o Dpkg::Use-Pty=0 install clang clang-tidy cmake curl g++ python3 tar valgrind -y
su - $(whoami)
cd $(pwd)
./generate_results.bash
EOL

cat "$tmpfile"
chmod +x "$tmpfile"

docker run \
  --cap-add SYS_PTRACE \
  --mount type=bind,source=$(pwd),target=$(pwd) \
  ubuntu:bionic-20180821 \
  /bin/bash -x $(pwd)/"$tmpfile"
rm "$tmpfile"

