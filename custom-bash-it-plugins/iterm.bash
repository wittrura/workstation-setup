# Creates a badge in the current iTerm window
# Input: Text to display in the badge
task() {
  printf "\e]1337;SetBadgeFormat=%s\a" "$(echo "$*" | base64)";
}
