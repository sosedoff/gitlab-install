package :postgresql do
  sql_user        = "git"
  sql_db          = "gitlabhq_production"
  sql_password    = "password"
  sql_create_user = "CREATE USER #{sql_user} WITH PASSWORD '$#{sql_password}';"
  sql_create_db   = "CREATE DATABASE #{sql_db} OWNER #{sql_user};"

  apt "postgresql-9.1", "libpq-dev" do
    post :install, "sudo -u postgres psql -d template1 -c \"#{sql_create_user}\""
    post :install, "sudo -u postgres psql -d template1 -c \"#{sql_create_db}\""
    post :install, "sudo -u #{sql_user} -H psql -d #{sql_db} --list"
  end

  verify do
    has_apt "postgresql-9.1"
    has_apt "libpq-dev"
  end
end