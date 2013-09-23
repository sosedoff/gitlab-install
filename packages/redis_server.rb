package :redis_server do
  apt "redis-server"

  verify do
    has_apt "redis-server"
    has_executable "redis-server"
    has_file "/etc/redis.conf"
  end
end