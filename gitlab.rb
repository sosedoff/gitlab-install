$LOAD_PATH << "."

require "yaml"
require "hashr"

# Load all packages
Dir["./packages/**/*.rb"].each { |f| require(f) }

# Load config
$config = Hashr.new(YAML.load_file("./config.yml"))

policy :gitlab, :roles => :app do
  $config.packages.each { |name| requires(name) }
end

deployment do
  delivery :ssh do
    user       $config.target.user
    password   $config.target.password
    role :app, $config.target.host
  end

  source do
    prefix   "/usr/local"
    archives "/usr/local/sources"
    builds   "/usr/local/build"
  end
end