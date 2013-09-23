package :gitlab_shell do
  repo    = "https://github.com/gitlabhq/gitlab-shell.git"
  version = "1.7.1"
  path    = "/home/git/gitlab-shell"

  runner "sudo -u git -H git clone #{repo} #{path}" do
    post :install, "cd #{path} && sudo -u git -H git checkout v#{version}"
    post :install, "cd #{path} && sudo -u git -H cp config.yml.example config.yml"
    post :install, "cd #{path} && sudo -u git -H ./bin/install"
  end

  verify do
    has_directory path
    has_file "#{path}/config.yml"
  end
end