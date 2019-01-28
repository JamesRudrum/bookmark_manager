feature 'Test root' do
  scenario 'check homepage has title' do
    visit('/')
    expect(page).to have_content 'Rudrums Bookmark Manager'
  end
end
