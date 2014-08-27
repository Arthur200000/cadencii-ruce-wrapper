#!/bin/bash
# convert.c

crw-b64(){
  read f
  # Rounding, now it's the int i.
  f=$(printf "%.0f" "$f")
  # The 4096 step
  [[ "$f" -lt "0" ]] && ((f += 4096))
  f_low=$(( $f & 63 ))
  f_high=$(( ($f & 0xFC0) >> 6 ))
  # Time to encode. Now it is f*cking-bc-dependent. Will consider using cut+hexdump.
  # We need to add backslashes back to the oct string. Going to bed.
  printf "%b" "$(_crw-intoct $f_low)$(_crw-intoct $f_high)" | base64
}

_crw-intoct(){
  printf '%o' $(echo "obase=8;ibase=10;$*" | bc)
}
