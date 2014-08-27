#!/bin/bash
# convert.c

crw-b64(){
  read f
  # Rounding, now it's the int i.
  f=$(printf "%.0f" "$f")
  # The 4096 step
  [[ "$f" -lt "0" ]] && f=$(($f + 4096))
  f_low=$(( $f & 63 ))
  f_high=$(( ($f & 0xFC0) >> 6 ))
  echo $f_low
  echo $f_high
  # Time to encode, TODO
  printf $(_crw-intchar $f_low | base64) 
  printf $(_crw-intchar $f_high | base64)
}

_crw-intchar(){
  printf "%b" $(printf '\%d' $*)
}
