require 'pg'

class Bookmark
  def self.all
    con = PG.connect :dbname => 'bookmark_manager'
    # use pg gem to connect to bookmark_manager database
    bm = con.exec("SELECT * FROM bookmarks;")
    # select all bookmarks from the bookmark table in bookmark_manager database
    # this returns an array of hashes
    # [{"id" => "1", "url", "www.google.com"}]
    bm.map { |bookmarks| bookmarks['url'] }
    # use map to create array
    # can use map as "SELECT * FROM bookmarks;" returns an array of hashes
    # bm.map { |bookmarks| bookmarks['url'] } for each element in enumerable
    # do block. The block in this instance creates a bookmark by using the 'url'
    # key from the hashes in the array.
  end
end
