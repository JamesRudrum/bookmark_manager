require 'pg'
module Insert
  def bookmark_insert
    Bookmark.create(url: "www.reddit.com")
    Bookmark.create(url: "www.github.com")
    Bookmark.create(url: "www.livescore.com")

  end
end
