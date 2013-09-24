package :gitlab_services do
  runner "/etc/init.d/gitlab start"

  verify do
    # Make sure nginx and redis are running
    has_process "nginx"
    has_process "redis-server"

    # Make sure unicorn and sidekiq are running
    runs_without_error 'ps ax | grep -c "[u]nicorn_rails"'
    runs_without_error 'ps ax | grep -c "[s]idekiq"'
  end
end