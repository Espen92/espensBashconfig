declare -A FUNC_DESCRIPTIONS

show_colors() {
  for i in {0..255}; do
    printf "\e[38;5;${i}m%3d " "$i"
    if (( i % 16 == 15 )); then echo; fi
  done
  echo -e "\e[0m"
}
FUNC_DESCRIPTIONS[show_colors]="Display 256 ANSI colors for prompt styling"

lsdir() {
  if [[ "$1" == "-a" ]]; then
    ls -ld -- */ .*/ 2>/dev/null | grep '^d' | awk '{print $NF}'
  else
    ls -ld -- */ 2>/dev/null | grep '^d' | awk '{print $NF}'
  fi
}
FUNC_DESCRIPTIONS[lsdir]="List only directories in current path (-a includes hidden)"

cleantext() {
  local file="$1"
  if [[ ! -f "$file" ]]; then
    echo "File not found: $file" >&2
    return 1
  fi
    tmp=$(mktemp)
    LC_ALL=C tr -cd '[:alnum:][:space:]!"#$%&/()=?`±≈\[\]\|§∞€£™©¡®¥¢‰¶{}≠¿–—…·.:;‚„,\\-' < "$file" > "$tmp"
    mv "$tmp" "$file"
}
FUNC_DESCRIPTIONS[cleantext]="Strip unwanted Unicode from file, keep readable punctuation"

functions() {
  for func in "${!FUNC_DESCRIPTIONS[@]}"; do
    printf "%-15s - %s\n" "$func" "${FUNC_DESCRIPTIONS[$func]}"
  done | sort
}