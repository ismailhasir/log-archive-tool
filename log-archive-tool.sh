#!/bin/bash

#Step-1: Ask the user for the directory to archive and validate the input
directory=$1
archive=~/log-archives/
date=$(date +%Y%m%d_%H%M%S)

if [ $# -eq 0 ]; then
    echo "No directory provided. Please provide a directory to archive."
    exit
elif [ ! -d "$directory" ]; then
    echo "The provided path is not a valid directory. Please provide a valid directory."
    exit
else 
echo "Archiving directory: $directory"
fi

#Step-2 Checking if the archive directory exists, if not create it
if [ ! -d "$archive" ]; then
echo "Archive directory does not exist. Creating archive directory..."
  if mkdir -p "$archive"; then
  echo "Archive directory created successfully."
  else
  echo "Failed to create archive directory. Please check permissions."
  exit 1
  fi
else
echo "Archive directory exists. Continuing..."
fi

#Step-3: Create a tar.gz archive of the specified directory
archive_name="logs_archive_${date}.tar.gz"
if tar -czf "$archive/$archive_name" -C "$directory" .; then
    echo "Archive created successfully: $archive/$archive_name"
else
    echo "Failed to create archive. Please check the directory and try again."
    exit 1
fi

#Step-4: Log the date and time of the archive

log_file="$archive/archive.log"

if echo "$date - Archive created successfully: $archive_name" >> "$log_file"; then

    echo "Archive creation logged successfully."

else

    echo "Failed to write archive log."
    exit 1

fi