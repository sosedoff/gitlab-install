package :postfix do
  apt "postfix"

  verify do
    has_apt "postfix"
  end
end