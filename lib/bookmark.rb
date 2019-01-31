require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end



  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end

    # use pg gem to connect to bookmark_manager database
    bm = con.exec("SELECT * FROM bookmarks;")
    # select all bookmarks from the bookmark table in bookmark_manager database
    # this returns an array of hashes
    # [{"id" => "1", "url", "www.google.com"}]
    bm.map do|bookmarks|
      Bookmark.new(id: bookmarks['id'], title: bookmarks['title'], url: bookmarks['url'])
    end
    # use map to create array
    # can use map as "SELECT * FROM bookmarks;" returns an array of hashes
    # bm.map { |bookmarks| bookmarks['url'] } for each element in enumerable
    # do block. The block in this instance creates a bookmark by using the 'url'
    # key from the hashes in the array.
  end

  def self.create(title:, url:)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end

    result = con.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title;")

    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end
end
