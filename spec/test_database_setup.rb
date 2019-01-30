require 'pg'

def test_database_setup
  con = PG.connect :dbname => 'bookmark_manager_test'

  con.exec ("TRUNCATE TABLE bookmarks;")
end
