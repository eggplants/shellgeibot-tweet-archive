#!/bin/bash

# https://gist.github.com/ikemonn/a3cc111c252e86de556a

awk '                                                                \
  # ファイルの最初の行でマッチさせる                                 \
  BEGIN {                                                            \
    while (getline line) {                                           \
      s = line;                                                      \
      # ダブルクォートの数をチェック                                 \
      gsub(/[^"]/, "", s);                                           \
      # ダブルクォート数が偶数なら改行、奇数なら改行しない           \
      if (((length(s)+cy) % 2) == 0) {                               \
        cy = 0;                                                      \
        printf("%s\n", line);                                        \
      } else {                                                       \
        cy = 1;                                                      \
        printf("%s", line);                                          \
      }                                                              \
    }                                                                \
  }                                                                  \
' "$1"
