package :bundler do
  gem "bundler", version: "1.3.5"

  verify do
    has_gem "bundler", "1.3.5"
  end
end