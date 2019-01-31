require 'pg'
module Insert
  def bookmark_insert
    Bookmark.create(title: 'reddit', url: "www.reddit.com")
    Bookmark.create(title: 'github', url: "www.github.com")
    Bookmark.create( title: 'livescore', url: "www.livescore.com")
  end
end
