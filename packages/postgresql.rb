package :postgresql do
  apt "postgresql-9.1", "libpq-dev"

  verify do
    has_apt "postgresql-9.1"
    has_apt "libpq-dev"
  end
end