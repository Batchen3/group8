#!/bin/bash

# Validate input
if [ $# -lt 2 ]; then
    echo "Usage: main.sh -1 <target_directory> <image_url1> [<image_url2> ...]"
    exit 1
fi

# Create target directory if it doesn't exist
target_directory="$1"
mkdir -p "$target_directory"

# Download images
for url in "${@:2}"; do
    if wget --no-check-certificate -P "$target_directory" "$url"; then
        echo "Downloaded: $url"
    fi
done

# Create archive
current_time=$(date "+%Y%m%d%H%M%S")
archive_name="images_$current_time.zip"
zip -q -j "$archive_name" "$target_directory"/*

echo "Archive created: $archive_name"
