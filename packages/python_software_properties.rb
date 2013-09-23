package :python_software_properties do
  apt "software-properties-common"

  verify do
    has_apt "software-properties-common"
    has_executable "add-apt-repository"
  end
end