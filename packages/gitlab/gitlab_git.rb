package :gitlab_git do
  path = "/home/git"

  runner "cd #{path} && sudo -u git -H git config --global user.name \"GitLab\""
  runner "cd #{path} && sudo -u git -H git config --global user.email \"gitlab@localhost\""
  runner "cd #{path} && sudo -u git -H git config --global core.autocrlf input"

  verify do
    runs_without_error "cd #{path} && sudo -u git -H git config --get user.name | grep GitLab"
    runs_without_error "cd #{path} && sudo -u git -H git config --get user.email | grep gitlab@localhost"
    runs_without_error "cd #{path} && sudo -u git -H git config --get core.autocrlf | grep input"
  end
end