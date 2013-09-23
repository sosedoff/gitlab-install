package :gitlab do
  repo   = "https://github.com/gitlabhq/gitlabhq.git"
  path   = "/home/git/gitlab"
  branch = "6-1-stable"

  runner "cd /home/git && sudo -u git -H git clone #{repo} gitlab" do
    # Checkout specified branch
    post :install, "cd #{path} && sudo -u git -H git checkout #{version}"

    # Copy the example GitLab config
    post :install, "cd #{path} && sudo -u git -H cp config/gitlab.yml.example config/gitlab.yml"

    # Make sure GitLab can write to the log/ and tmp/ directories
    post :install, "cd #{path} && sudo chown -R git log/"
    post :install, "cd #{path} && sudo chown -R git tmp/"
    post :install, "cd #{path} && sudo chmod -R u+rwX log/"
    post :install, "cd #{path} && sudo chmod -R u+rwX  tmp/"

    # Create directory for satellites
    post :install, "cd #{path} && sudo -u git -H mkdir gitlab-satellites"

    # Create directories for sockets/pids and make sure GitLab can write to them
    post :install, "cd #{path} && sudo -u git -H mkdir tmp/pids/"
    post :install, "cd #{path} && sudo -u git -H mkdir tmp/sockets/"
    post :install, "cd #{path} && sudo chmod -R u+rwX  tmp/pids/"
    post :install, "cd #{path} && sudo chmod -R u+rwX  tmp/sockets/"

    # Create public/uploads directory otherwise backup will fail
    post :install, "cd #{path} && sudo -u git -H mkdir public/uploads"
    post :install, "cd #{path} && sudo chmod -R u+rwX  public/uploads"

    # Copy the example Unicorn config
    post :install, "cd #{path} && sudo -u git -H cp config/unicorn.rb.example config/unicorn.rb"

    # Configure Git global settings for git user, useful when editing via web
    # Edit user.email according to what is set in gitlab.yml
    post :install, "cd #{path} && sudo -u git -H git config --global user.name \"GitLab\""
    post :install, "cd #{path} && sudo -u git -H git config --global user.email \"gitlab@localhost\""
    post :install, "cd #{path} && sudo -u git -H git config --global core.autocrlf input"
  end

  verify do
    has_directory path
    has_directory "#{path}/log"
    has_directory "#{path}/tmp"
    has_file "#{path}/config/gitlab.yml"
    has_file "#{path}/config/unicorn.rb"
  end
end