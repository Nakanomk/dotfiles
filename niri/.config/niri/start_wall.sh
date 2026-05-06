#!/bin/bash

if [ -z "$1" ]; then
  echo "使用方法: $0 /路径/到/你的/壁纸.jpg"
  exit 1
fi

IMG_PATH="$1"
# 【修改这里】：将模糊图片存到不会被重启清空的 cache 目录里
BLURRED_PATH="$HOME/.cache/niri_overview_blur.jpg"

echo "$IMG_PATH" >~/.config/niri/current_wallpaper.txt

# 手动换壁纸时，保留擦除动画
awww img "$IMG_PATH" --transition-type wipe

echo "正在生成模糊壁纸，请稍候..."
magick "$IMG_PATH" -blur 0x25 "$BLURRED_PATH"

awww img -n overview "$BLURRED_PATH" --transition-type none

echo "壁纸设置完成！"
