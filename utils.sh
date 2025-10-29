#!/bin/bash

LOG_FILE="$KANSO_REPO/kanzo.log"

log() {
    local level="${1:-INFO}"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    case "$level" in
    "ERROR") gum log --structured --level error "$message" ;;
    "WARN") gum log --structured --level warn "$message" ;;
    "SUCCESS")
        printf "%s " "$(gum style --foreground '#00FF7F' --bold 'SUCCESS' | tr -d '\n')"
        echo "$message"
        ;;
    "INFO") gum log --structured --level info "$message" ;;
    *) gum log --structured --level info "$message" ;;
    esac

    echo "[$timestamp] [LOG] [$level] $message" >>"$LOG_FILE"
}

silent_log() {
    mkdir -p "$(dirname "$LOG_FILE")"
    "$@" >>"$LOG_FILE" 2>&1
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}
