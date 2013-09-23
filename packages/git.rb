package :git do
  runner "add-apt-repository -y ppa:git-core/ppa" do
    post :install, "apt-get update -y"
  end

  apt "git"
end