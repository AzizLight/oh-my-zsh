alias rdbm='rake db:migrate'
alias routes="rake routes | sed -e \"1d\" -e \"s,^[^/]*,,g\" | awk '{print $1}' | uniq | sort"
