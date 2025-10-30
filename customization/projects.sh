#!/bin/bash

PROJECTS_DIR="$USER_SETUP_DIR/projects"
TARGET_BASE_DIR="$HOME/projects"

if [[ -d "$PROJECTS_DIR" ]] && compgen -G "$PROJECTS_DIR/*.txt" >/dev/null; then
    if gum confirm "Project definition files detected in '~/user-setup/projects'. Do you want to clone these projects automatically?"; then
        log "INFO" "Starting automatic project cloning..."

        mkdir -p "$TARGET_BASE_DIR"

        for file in "$PROJECTS_DIR"/*.txt; do
            [[ -e "$file" ]] || continue

            folder_name=$(basename "$file" .txt)
            target_dir="$TARGET_BASE_DIR/$folder_name"

            log "INFO" "Processing project list: $folder_name"
            mkdir -p "$target_dir"

            while IFS= read -r repo_url || [[ -n "$repo_url" ]]; do
                repo_url=$(echo "$repo_url" | tr -d '\r' | xargs)
                [[ -z "$repo_url" || "$repo_url" =~ ^# ]] && continue

                repo_name=$(basename "$repo_url" .git)
                clone_path="$target_dir/$repo_name"

                if [[ -d "$clone_path/.git" ]]; then
                    log "WARN" "Skipping existing repo: $repo_name (already cloned)"
                else
                    log "INFO" "Cloning $repo_name..."
                    if git clone -q "$repo_url" "$clone_path"; then
                        log "SUCCESS" "$repo_name cloned successfully"
                    else
                        log "ERROR" "Failed to clone $repo_url"
                    fi
                fi
            done <"$file"
        done

        log "SUCCESS" "All projects processed."
    else
        log "WARN" "User skipped project cloning."
    fi
else
    log "INFO" "No project files found in '~/user-setup/projects', skipping cloning."
fi
