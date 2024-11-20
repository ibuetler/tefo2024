# setup vm on Scaleway
apt update
apt install docker.io net-tools
mkdir -p /opt/git
cd /opt/git
git clone --recurse-submodules https://github.com/cobbr/Covenant
cd /opt/git/Covenant/Covenant
docker build -t covenant .
docker run -it -p 7443:7443 -p 8080:8080 -p 4433:4433 -p 80:80 -p 443:443 --name covenant -v /opt/git/Covenant/Covenant/Data:/app/Data covenant --username AdminUser --computername 0.0.0.0

