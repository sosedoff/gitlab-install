package :gitlab_setup do
  path = "/home/git/gitlab"

  runner "cd #{path} && printf \"yes\n\" | sudo -u git -H bundle exec rake gitlab:setup RAILS_ENV=production" do
    # Setup init script
    runner "sudo cp #{path}/lib/support/init.d/gitlab /etc/init.d/gitlab"
    runner "sudo chmod +x /etc/init.d/gitlab"

    # Make GitLab start on boot
    runner "sudo update-rc.d gitlab defaults 21"
  end

  runner "cd #{path} && sudo -u git -H bundle exec rake gitlab:env:info RAILS_ENV=production"

  verify do
    has_file "/etc/init.d/gitlab"
  end
end