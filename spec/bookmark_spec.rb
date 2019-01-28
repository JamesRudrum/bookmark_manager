require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include('www.reddit.com')
      expect(bookmarks).to include('www.livescore.com')
      expect(bookmarks).to include('www.github.com')
    end
  end
end
