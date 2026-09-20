# Log Archive Tool

A lightweight Bash utility for archiving a directory into a compressed timestamped `.tar.gz` file and logging the operation.

## Overview

This project provides a simple script that:

- validates the directory path provided by the user
- creates an archive folder in the home directory if it does not exist
- compresses the selected directory into a `.tar.gz` archive
- stores the archive under `~/log-archives/`
- records the archive creation in `~/log-archives/archive.log`

The script is especially useful for backing up log directories or other generated data folders.

## Requirements

- Bash
- `tar` utility
- Linux or Unix-like environment

## Usage

Run the script with the directory you want to archive:

```bash
./log-archive-tool.sh /path/to/directory
```

Or using bash explicitly:

```bash
bash log-archive-tool.sh /path/to/directory
```

## Example

```bash
./log-archive-tool.sh /var/log
```

This creates an archive similar to:

```bash
~/log-archives/logs_archive_20260920_153045.tar.gz
```

The archive is created from the contents of the target folder, and the script writes an entry such as the following to the log file:

```bash
20260920_153045 - Archive created successfully: logs_archive_20260920_153045.tar.gz
```

## Script Behavior

- If no path is provided, the script prints an error and exits.
- If the given path is not a valid directory, the script prints an error and exits.
- If `~/log-archives` does not exist, the script creates it automatically.
- If archive creation fails, the script prints an error and exits with status code `1`.
- If logging fails, the script prints an error and exits with status code `1`.

## File Structure

```text
log-archive-tool/
├── log-archive-tool.sh
├── README.md
└── ~/log-archives/
    ├── archive.log
    └── logs_archive_YYYYMMDD_HHMMSS.tar.gz
```

## Notes

This script is intentionally simple and focused on quick log archiving. It can be used as a starting point for more advanced backup or retention workflows in the future.

Project Idea: https://roadmap.sh/projects/log-archive-tool