package :gitlab_user do
  runner "adduser --disabled-login --gecos 'GitLab' git"

  verify do
    has_user "git"
    has_directory "/home/git"
  end
end