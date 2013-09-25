package :gitlab_git do
  path = "/home/git"

  user_name  = $config.git.user_name
  user_email = $config.git.user_email

  runner "cd #{path} && sudo -u git -H git config --global user.name \"#{user_name}\""
  runner "cd #{path} && sudo -u git -H git config --global user.email \"#{user_email}\""
  runner "cd #{path} && sudo -u git -H git config --global core.autocrlf input"

  verify do
    runs_without_error "cd #{path} && sudo -u git -H git config --get user.name | grep #{user_name}"
    runs_without_error "cd #{path} && sudo -u git -H git config --get user.email | grep #{user_email}"
    runs_without_error "cd #{path} && sudo -u git -H git config --get core.autocrlf | grep input"
  end
end