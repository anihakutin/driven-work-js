require 'rspec/core/rake_task'

namespace :pg-rails do
  desc 'Start rails http server with postgres'
  task :start do
    sh "pg_ctl -D /usr/local/var/postgres start"
  end

  desc 'Stop rails server and kill postgres'
  task :stop do
    sh "pg_ctl -D /usr/local/var/postgres stop"
    sh "killall -9 rails"
  end
end
