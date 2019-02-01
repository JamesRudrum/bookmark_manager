feature 'Delete Bookmarks' do
  scenario 'check that a bookmark can be deleted' do
    Bookmark.create( title: 'livescore', url: "www.livescore.com")
    visit('/bookmarks')
    expect(page).to have_link('livescore', href: 'www.livescore.com')
    first('.bookmark').click_button 'Delete!'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('livescore', href: 'www.livescore.com')
  end
end
