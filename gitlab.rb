$LOAD_PATH << "."

# Require all packages
Dir["./packages/**/*.rb"].each { |f| require(f) } 

policy :gitlab, :roles => :app do
  requires :apt_update
  requires :build_essentials
  requires :python_software_properties
  requires :git
  requires :python
  requires :python_docutils
  requires :redis
  requires :postgresql
  requires :nginx
  requires :ruby
  requires :rubygems
  requires :bundler
  requires :gitlab
end

deployment do
  delivery :ssh do
    user       ENV['TARGET_USER']
    password   ENV['TARGET_PASSWORD']
    role :app, ENV['TARGET_HOST']
  end

  source do
    prefix   "/usr/local"
    archives "/usr/local/sources"
    builds   "/usr/local/build"
  end
end