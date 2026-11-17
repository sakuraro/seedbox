# How to use
## clone repo in remote
```
git clone https://github.com/sakuraro/seedbox.git
cd ./seedbox
mkdir -p ./autobrr/data/config
mkdir -p ./qbittorrent/data/{config,downloads}
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
docker logs qbittorrent
```
## stop services
```
docker compose down
```
