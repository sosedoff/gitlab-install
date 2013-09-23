package :gitlab_postgres do
  sql_user        = "git"
  sql_db          = "gitlabhq_production"
  sql_password    = "password"
  sql_create_user = "CREATE USER #{sql_user} WITH PASSWORD '$#{sql_password}';"
  sql_create_db   = "CREATE DATABASE #{sql_db} OWNER #{sql_user};"

  runner "sudo -u postgres psql -d template1 -c \"#{sql_create_user}\""
  runner "sudo -u postgres psql -d template1 -c \"#{sql_create_db}\""
  runner "sudo -u #{sql_user} -H psql -d #{sql_db} --list"
end