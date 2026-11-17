#!/usr/bin/bash
# 1. 定义锁文件路径和日志（放在可写目录）
LOCK_FILE="/tmp/qbittorrent_post_process.lock"
LOG_FILE="/tmp/qbittorrent_post_process.log"

# 2. 获取文件锁（文件描述符 200）
exec 200>"$LOCK_FILE"
if ! flock -w 3600 200; then
    echo "$(date): 等待锁超时，放弃本次: $1" >> "$LOG_FILE"
    exit 0
fi

echo "$(date): 获取锁成功，开始处理: $1" >> "$LOG_FILE"

# 3. 以下为实际后处理逻辑
TORRENT_NAME="$1"
TORRENT_DIR="$2"
CATAGORY="$3"

echo "$(date): 获取锁成功，开始处理: $TORRENT_NAME" >> "$LOG_FILE"
# ... 在这里编写你的移动文件、硬链接、调用 rclone 等命令 ...
# 例如: rclone copy "$CONTENT_PATH" remote:path/
rclone copy "$TORRENT_DIR/$TORRENT_NAME" "115:云下载/$CATAGORY/$TORRENT_NAME" \
  --transfers 1 \
  -vv

# 4. 显式释放锁（可选，脚本退出时也会自动释放）
flock -u 200
echo "$(date): 处理完成: $TORRENT_NAME" >> "$LOG_FILE"