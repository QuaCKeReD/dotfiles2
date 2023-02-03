#!/usr/bin/env bash

dest=$(readlink "${1}")

echo "symlink dest: ${dest}"

sudo rm -rf "${1}"

cp -r "${dest}" ./"${1}"/
