feature 'Bookmarks Root' do
  scenario 'check there are bookmarks listed' do
    visit('/bookmarks')
    expect(page).to have_content 'www.reddit.com'
    expect(page).to have_content 'www.livescore.com'
    expect(page).to have_content 'www.github.com'
  end
end
