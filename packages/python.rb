package :python do
  apt "python"

  verify do
    has_executable "python"
    has_executable "python2"
    has_executable_with_version "python", "2.7.4", "--version"
  end
end