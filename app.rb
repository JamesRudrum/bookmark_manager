require 'sinatra/base'
require './lib/bookmark'



class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])

    redirect '/bookmarks'
  end

  get '/' do
    'Rudrums Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all

    erb(:"bookmarks/index")
  end

  get '/bookmarks/new' do
    erb(:"bookmarks/new")
  end

  post '/bookmarks/new' do
    Bookmark.create(title: params['title'], url: params['url'])

    redirect '/bookmarks'
    # redirect back to page where bookmarks are displayed

    # url = params['url']
    # get url from submitted form data using params
    # con = PG.connect :dbname => 'bookmark_manager_test'
    # connect to test database
    # con.exec ("INSERT INTO bookmarks (url) VALUES( '#{url}' ');")
    # sql insert url into database table with url value submitted by user
  end

  run if app_file == $0
end
