package :gitlab_git do
  runner "cd /home/git && sudo -u git -H git config --global user.name \"GitLab\""
  runner "cd /home/git && sudo -u git -H git config --global user.email \"gitlab@localhost\""
  runner "cd /home/git && sudo -u git -H git config --global core.autocrlf input"
end