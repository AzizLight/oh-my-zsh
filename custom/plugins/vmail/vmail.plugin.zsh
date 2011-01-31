# Shell function to support multiple accounts for
# vmail using one command.
# Taken from: https://gist.github.com/743626
vm() {
  list_of_emails="/Users/aziz/Dropbox/Private/list_of_emails"
  if [[ $1 = "r" ]]; then
    rvm 1.9.2 exec vmail -c ~/.vmailrc-rob
  elif [[ $1 = "z" ]]; then
    rvm 1.9.2 exec vmail -c ~/.vmailrc-aziz
  elif [[ $1 = "y" ]]; then
    rvm 1.9.2 exec vmail -c ~/.vmailrc-youjiii
  elif [[ $1 = "l" ]]; then
    rvm 1.9.2 exec vmail -c ~/.vmailrc-leeloo
  elif [[ $1 = "rsub" ]]; then
    rvm 1.9.2 exec vmail -c ~/.vmailrc-robsub
  else
    echo "Please specify an account."
    cat list_of_emails
  fi
}
