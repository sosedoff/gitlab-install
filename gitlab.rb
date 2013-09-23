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
  requires :redis_server
  requires :postgresql
  requires :postfix
  requires :nginx
  requires :ruby
  requires :rubygems
  requires :bundler
  
  requires :gitlab_user
  requires :gitlab_postgres
  requires :gitlab_shell
  requires :gitlab
  requires :gitlab_gems
  requires :gitlab_db
  requires :gitlab_setup
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