require 'bookmark'
require_relative '../helpers/database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do

      con = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = bookmark_insert

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'reddit'
      expect(bookmarks.first.url).to eq "www.reddit.com"
    end
  end

  describe '.delete' do
    it 'deletes bookmark' do

      bookmarks = Bookmark.create( title: 'livescore', url: "www.livescore.com")
      Bookmark.delete(id: bookmarks.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.create' do
    it 'adds bookmark' do
      bookmark = Bookmark.create(title: 'Sky Sports', url: 'www.skysports.com')
      persisted_data = persisted_data(id: bookmark.id)


      expect(bookmark).to be_a Bookmark
      expect(bookmark.title).to eq 'Sky Sports'
      expect(bookmark.url).to eq 'www.skysports.com'
    end
  end
end
