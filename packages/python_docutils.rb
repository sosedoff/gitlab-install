package :python_docutils do
  apt "python-docutils"

  verify do
    has_apt "python-docutils"
  end
end