#!/bin/env bash
set -euo pipefail

REFERENCE_DIRECTORY="$(cd "$(dirname "$0")/.." && pwd)/reference"

# echo  "Reference Directory: ${REFERENCE_DIRECTORY}"

COTTON_DIRECTORY="${REFERENCE_DIRECTORY}/django-cotton/"

if [ ! -d "${COTTON_DIRECTORY}" ] || [ "$(find "${COTTON_DIRECTORY}" -maxdepth 0 -mtime +14 2>/dev/null)" ]; then
  echo "Cloning documentation in ${COTTON_DIRECTORY}"
  rm -rf "${COTTON_DIRECTORY}"
  git clone --depth 1 https://github.com/wrabit/django-cotton "${COTTON_DIRECTORY}"
else
    echo "Cotton Documentation already available in ${COTTON_DIRECTORY}"
fi
