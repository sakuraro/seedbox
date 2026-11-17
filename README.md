# How to use
## clone repo in remote
```
git clone https://github.com/sakuraro/seedbox.git
mkdir -p ./seedbox/autobrr/data
mkdir -p ./seedbox/qbittorrent/data
```
## upload configuration from local (if needed)
```
user="" && remote="" && path=""
scp -C -r ./autobrr/data $user@$remote:$path/seedbox/autobrr/data
scp -C -r ./qbittorrent/data $user@$remote:$path/seedbox/qbittorrent/data
```
## start services
```
docker compose build
docker compose up -d
```
## show qbittorrent user/password
```
docker log qbittorrent
```
## stop services
```
docker compose down
```
