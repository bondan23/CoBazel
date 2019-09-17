#!/bin/bash
POD_NAME=$1
PRODUCT_MODULE_NAME=$2
PODS_DIR="$PWD/Pods"
WORKING_DIR="$PODS_DIR/$POD_NAME"
HEADER_DIR="${WORKING_DIR}/BazelSupport/${PRODUCT_MODULE_NAME}"

[ -d "$HEADER_DIR" ] && rm -rf "${HEADER_DIR}"
[ ! -d "$HEADER_DIR" ] && mkdir -p "${HEADER_DIR}"

# Copy Header
COPY_HEADERS=$(find "$WORKING_DIR" -iname "*.h" -o -iname "*.hpp" -o -iname "*.ipp" -type f)
  while read line; do
    if [ -f "$line" ]; then
      ditto ${line} "${HEADER_DIR}"
      printf "copied %s\n" "${line}"
    fi
  done <<<"$COPY_HEADERS"

# Target Support File
GET_UMBRELLA_HEADER="${PODS_DIR}/Target Support Files/${POD_NAME}/${POD_NAME}-umbrella.h"
[ -f "$GET_UMBRELLA_HEADER" ] && ditto "${GET_UMBRELLA_HEADER}" $HEADER_DIR

GET_MODULE_MAP="${PODS_DIR}/Target Support Files/${POD_NAME}/${POD_NAME}.modulemap"
if [ -f "$GET_MODULE_MAP" ]; then
  ditto "${GET_MODULE_MAP}" $HEADER_DIR

  # Edit The moduleamp
  sed -i '' "s/framework //g" "${HEADER_DIR}/${POD_NAME}.modulemap"
fi