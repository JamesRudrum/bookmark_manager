feature 'Bookmarks Root' do
  scenario 'check there are bookmarks listed' do
    bookmark_insert

    visit('/bookmarks')

    expect(page).to have_link('reddit', href: 'www.reddit.com')
    expect(page).to have_link('livescore', href: 'www.livescore.com')
    expect(page).to have_link('github', href: 'www.github.com')
  end
end
