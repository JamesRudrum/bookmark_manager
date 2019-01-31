feature 'Add Bookmarks' do
  scenario 'check that a bookmark can be added to /bookmarks' do
    bookmark_insert
    visit('/bookmarks/new')
    fill_in :url, with: 'www.skysports.com'
    fill_in :title, with: 'Sky Sports'
    click_button 'Add Bookmark!'

    expect(page).to have_link('Sky Sports', href: 'www.skysports.com')
  end
end
