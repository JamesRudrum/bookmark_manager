require 'bookmark'

describe Bookmark do
  before(:each) do
    con = PG.connect :dbname => 'bookmark_manager_test'

    con.exec ("TRUNCATE TABLE bookmarks;")

    con.exec ("INSERT INTO bookmarks (url) VALUES( 'www.reddit.com' );")
    con.exec ("INSERT INTO bookmarks (url) VALUES( 'www.livescore.com' );")
    con.exec ("INSERT INTO bookmarks (url) VALUES( 'www.github.com' );")
  end

  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      
      expect(bookmarks).to include('www.reddit.com')
      expect(bookmarks).to include('www.livescore.com')
      expect(bookmarks).to include('www.github.com')
    end
  end
end
