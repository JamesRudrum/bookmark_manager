feature 'Add Bookmarks' do
  scenario 'check that a bookmark can be added to /bookmarks' do
    bookmark_insert
    visit('/bookmarks/new')
    fill_in :url, with: 'www.skysports.com'
    click_button 'Add Bookmark!'
    expect(page).to have_content 'www.skysports.com'
  end
end
