package :gitlab_nginx do
  config = "/home/git/gitlab/lib/support/nginx/gitlab"

  runner "cat #{config} > /etc/nginx/sites-enabled/default" do
    post :install, "sed -i 's/YOUR_SERVER_FQDN/_/g' /etc/nginx/sites-enabled/default"
    post :install, "/etc/init.d/nginx restart"
  end

  verify do
    has_file "/etc/nginx/sites-enabled/default"
    file_contains "/etc/nginx/sites-enabled/default", "GITLAB"
  end
end