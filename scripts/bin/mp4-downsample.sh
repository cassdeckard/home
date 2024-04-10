#!/bin/bash

function usage {
    cat << HEREDOC_END
Usage: $0 <target_size_MB> <input_file>
    target_size_MB: The target size of the output file in MB
    input_file: The input file to downsample
HEREDOC_END
    exit 1
}

# print usage if the number of arguments is less than 2
if [[ $# -ne 2 ]]; then
    usage
fi
target_size_MB=$1; shift
input_file=$1; shift
input_file_minus_extension="${input_file%.*}"
output_file="$input_file_minus_extension-small.mp4"

duration_sec=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$input_file")
duration_sec=$(awk "BEGIN {printf int($duration_sec * 1.2)}" ) # add 20% to the duration to be safe
bitrate=$(((8192 * $target_size_MB) / $duration_sec ))

set -x
ffmpeg -i "$input_file" -b:v "${bitrate}k" "$output_file"
set +x