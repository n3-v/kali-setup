sudo apt install qemu-user -y
sudo dpkg --add-architecture amd64

cat > /etc/apt/sources.list.d/amd64.list <<EOF
deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy main restricted universe multiverse
deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy-updates main restricted universe multiverse
deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse
deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse
EOF
sudo apt update
sudo apt install libc6:amd64

sudo apt --fix-broken install -y