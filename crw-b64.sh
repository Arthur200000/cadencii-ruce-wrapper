#!/bin/bash
# convert.c

crw64='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

# convert
crw-b64index(){ printf ${crw64:$1:1}; }

# main, Base64ForUtau
crw-b64(){
  read f
  # Rounding, now it's the int i.
  f=$(printf "%.0f" "$f")
  # The 4096 step
  [[ "$f" -lt "0" ]] && ((f += 4096))
  f_low=$(( $f & 63 ))
  f_high=$(( ($f & 0xFC0) >> 6 ))
  # Time to encode. Can be slow.
  crw-b64index $f_low
  crw-b64index $f_high
}
