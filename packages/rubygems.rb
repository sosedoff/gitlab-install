package :rubygems do
  version = "2.1.3"
  file    = "rubygems-#{version}.tgz"
  url     = "http://production.cf.rubygems.org/rubygems/#{file}"

  runner "wget #{url}" do
    post :install, "tar -zxf #{file}"
    post :install, "cd rubygems-#{version} && ruby setup.rb"
    post :install, "rm -rf ~/rubygems-*"
  end

  verify do
    has_executable_with_version "gem", version
  end
end