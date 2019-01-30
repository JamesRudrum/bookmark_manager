require 'pg'
module Insert
  def bookmark_insert
    con = PG.connect :dbname => 'bookmark_manager_test'

    con.exec ("INSERT INTO bookmarks (url) VALUES( 'www.reddit.com' );")
    con.exec ("INSERT INTO bookmarks (url) VALUES( 'www.livescore.com' );")
    con.exec ("INSERT INTO bookmarks (url) VALUES( 'www.github.com' );")
  end
end
