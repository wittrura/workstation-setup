function ff() {
  s="${@}"
  find . -name "$(eval echo '${s}')"
}
