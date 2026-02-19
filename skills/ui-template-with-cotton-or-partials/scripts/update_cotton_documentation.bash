#!/bin/env bash
set -euo pipefail

DOCUMENTATION_DIRECTORY="$(cd "$(dirname "$0")/.." && pwd)/documentation"

# echo  "Reference Directory: ${DOCUMENTATION_DIRECTORY}"

COTTON_DIRECTORY="${DOCUMENTATION_DIRECTORY}/django-cotton/"

if [ ! -d "${COTTON_DIRECTORY}" ] || [ "$(find "${COTTON_DIRECTORY}" -maxdepth 0 -mtime +14 2>/dev/null)" ]; then
  echo "Cloning documentation in ${COTTON_DIRECTORY}"
  rm -rf "${COTTON_DIRECTORY}"
  git clone --depth 1 https://github.com/wrabit/django-cotton "${COTTON_DIRECTORY}"
else
    echo "Cotton Documentation already available in ${COTTON_DIRECTORY}"
fi
