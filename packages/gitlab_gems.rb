package :gitlab_gems do
  path = "/home/git/gitlab"

  runner "cd #{path} && sudo gem install charlock_holmes --version '0.6.9.4'"
  runner "cd #{path} && sudo -u git -H bundle install --deployment --without development test mysql aws"

  verify do
    has_gem "charlock_holmes", "0.6.9.4"
    has_directory "/home/git/gitlab/vendor/bundle"
  end
end