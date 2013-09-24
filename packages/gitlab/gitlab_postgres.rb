package :gitlab_postgres do
  pg_user     = "git"
  pg_database = "gitlabhq_production"
  pg_password = "password"
  create_user = "CREATE USER #{pg_user} WITH PASSWORD '$#{pg_password}';"
  create_db   = "CREATE DATABASE #{pg_database} OWNER #{pg_user};"

  runner "sudo -u postgres psql -d template1 -c \"#{create_user}\""
  runner "sudo -u postgres psql -d template1 -c \"#{create_db}\""

  verify do
    runs_without_error "sudo -u git psql postgres -tAc \"SELECT 1 FROM pg_roles WHERE rolname='#{pg_user}'\" | grep -q 1"
    runs_without_error "sudo -u git psql --list | grep #{pg_database}"
  end
end