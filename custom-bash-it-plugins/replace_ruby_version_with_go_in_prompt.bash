# This will overwrite the ruby_version_prompt fucntion called by the bash_it theme
ruby_version_prompt() {
  go version | awk -F " " '{print $3}'
}
