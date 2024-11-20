# start covenant
docker run -it -p 7443:7443 -p 8080:8080 -p 4433:4433 -p 80:80 -p 443:443 --name covenant -v /opt/git/Covenant/Covenant/Data:/app/Data covenant --username AdminUser --computername 0.0.0.0

