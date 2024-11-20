# setup vm on Scaleway
apt update -y
apt install -y docker.io net-tools
mkdir -p /opt/git
cd /opt/git
git clone --recurse-submodules https://github.com/cobbr/Covenant
cd /opt/git/Covenant/Covenant
docker build -t covenant .
