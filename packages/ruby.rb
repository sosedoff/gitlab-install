package :ruby do
  version    = "2.0.0"
  patchlevel = "p247"
  url        = "http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-#{version}-#{patchlevel}.tar.gz"

  source(url) do
    prefix "/usr/local"
  end

  verify do
    has_executable_with_version "ruby", "#{version}#{patchlevel}"
  end
end