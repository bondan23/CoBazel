#!/bin/bash
WORKING_DIR="$PWD/IGListKit/Source"
FEATURE_LIST=()
GET_FEATURE_YML=$(find "$WORKING_DIR" -iname "*.h" -type f)
  while read line; do
    cp ${line} IGListKit/iglistkitheader/IGListKit
    printf "copied %s\n" "${line}"
  done <<<"$GET_FEATURE_YML"
#   cat "$WORKING_DIR/base.yml" >> "$WORKING_DIR/project.yml"