function forever() {
  c=0
  while true
  do
    c=$((c+1))
    echo "Run #${c}"
    "$@"
    echo
    sleep 0.25
  done
}
