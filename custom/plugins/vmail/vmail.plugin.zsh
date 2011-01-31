# Shell function to support multiple accounts for
# vmail using one command.
# Taken from: https://gist.github.com/743626
vm() {
  if [[ $1 = "p" ]]; then
    rvm system exec vmail -c ~/.vmailrc-p
  elif [[ $1 = "w" ]]; then
    rvm system exec vmail -c ~/.vmailrc-w
  else
    echo "Please specify an account."
  fi
}
