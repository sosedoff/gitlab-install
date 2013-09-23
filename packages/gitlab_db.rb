package :gitlab_db do
  runner "sudo -u git cp config/database.yml.postgresql config/database.yml" do
    post :install, "cd /home/git/gitlab && sudo -u git -H chmod o-rwx config/database.yml"
  end

  verify do
    has_file "/home/git/gitlab/config/database.yml"
  end
end