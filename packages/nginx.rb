package :nginx do
  runner "add-apt-repository ppa:nginx/stable" do
    post :install, "apt-get update"
  end

  apt "nginx-full" do
    post :install, "/etc/init.d/nginx restart"
  end

  verify do
    has_directory "/etc/nginx"
  end
end