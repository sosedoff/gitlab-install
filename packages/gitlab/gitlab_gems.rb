package :gitlab_gems do
  gem "charlock_holmes", version: "0.6.9.4"

  path = "/home/git/gitlab"
  runner "cd #{path} && sudo -u git -H bundle install --deployment --without development test mysql aws"
end