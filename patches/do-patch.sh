#!/bin/bash

for a in $(find . -name '*.old'); do
  if [ -f "${a//.old/}" ]; then
    diff -Naur "$a" "${a//.old/}" >> busybox.patch
  fi
done
