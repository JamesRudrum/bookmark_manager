feature 'Bookmarks Root' do
  before(:each) do
    con = PG.connect :dbname => 'bookmark_manager_test'

    con.exec ("TRUNCATE TABLE bookmarks;")

    con.exec ("INSERT INTO bookmarks (url) VALUES( 'www.reddit.com' );")
    con.exec ("INSERT INTO bookmarks (url) VALUES( 'www.livescore.com' );")
    con.exec ("INSERT INTO bookmarks (url) VALUES( 'www.github.com' );")
  end
  scenario 'check there are bookmarks listed' do
    visit('/bookmarks')
    expect(page).to have_content 'www.reddit.com'
    expect(page).to have_content 'www.livescore.com'
    expect(page).to have_content 'www.github.com'
  end
end
