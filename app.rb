require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Rudrums Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all

    erb(:index)
  end

  run if app_file == $0
end
