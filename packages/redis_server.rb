package :redis_server do
  runner "add-apt-repository -y ppa:chris-lea/redis-server" do
    post :install, "apt-get update -y"
  end
  
  apt "redis-server" do
    post :install, "/etc/init.d/redis-server restart"
  end

  verify do
    has_apt "redis-server"
    has_executable "/usr/bin/redis-server"
    has_file "/etc/redis/redis.conf"
  end
end