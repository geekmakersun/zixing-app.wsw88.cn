#!/bin/bash

# 配置数据库信息
DB_USER="app_zixing"
DB_PASSWORD="n@Va.hl]15l-cwPt"
DB_NAME="app_zixing"
BACKUP_PATH="./backups"
BACKUP_FILE="$BACKUP_PATH/app_zixing-db_backup_$(date '+%Y-%m-%d_%H-%M-%S').sql"

# 确保备份目录存在
mkdir -p $BACKUP_PATH

# 导出数据库，避免表空间信息错误
mysqldump --user=$DB_USER --password=$DB_PASSWORD --no-tablespaces $DB_NAME > $BACKUP_FILE

# 检查备份是否成功
if [ $? -eq 0 ]; then
    echo "数据库备份成功: $BACKUP_FILE"
else
    echo "数据库备份失败！"
fi
