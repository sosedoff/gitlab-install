package :bundler do
  runner "gem install bundler --version 1.3.5"

  verify do
    has_executable_with_version "bundle", "1.3.4"
  end
end