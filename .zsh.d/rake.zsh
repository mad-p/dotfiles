# rake target completion

# References:
#  http://d.hatena.ne.jp/kouji0625/20080810
#  http://weblog.rubyonrails.org/2006/03/09/fast-rake-task-completion-for-zsh/

_rake_does_task_list_need_generating () {
  if [ ! -f .rake_tasks ]; then return 0;
  else
    return $([[ Rakefile -nt .rake_tasks ]])
  fi
}

_rake () {
  if [ -f Rakefile ]; then
    if _rake_does_task_list_need_generating; then
      echo "\nGenerating .rake_tasks..." > /dev/stderr
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks
    fi
    compadd $(<.rake_tasks)
  fi
}

compdef _rake rake
