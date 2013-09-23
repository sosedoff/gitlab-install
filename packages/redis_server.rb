package :redis_server do
  apt "redis-server" do
    post :install, "/etc/init.d/redis-server restart"
  end

  verify do
    has_apt "redis-server"
    has_executable "/usr/bin/redis-server"
    has_file "/etc/redis/redis.conf"
  end
end