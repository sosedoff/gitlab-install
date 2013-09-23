package :gitlab_git do
  runner "sudo -u git -H git config --global user.name \"GitLab\""
  runner "sudo -u git -H git config --global user.email \"gitlab@localhost\""
  runner "sudo -u git -H git config --global core.autocrlf input"
end