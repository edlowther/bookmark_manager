feature 'Adding links' do
  scenario 'clicking "add link" takes user to new link page' do
    visit '/links'
    click_on 'Add a new link'
    expect(page).to have_content('Enter a new link:')
  end
  scenario 'user can add a link to the list' do
    visit '/links/new'
    fill_in :title, with: 'BBC news'
    fill_in :url, with: 'www.bbc.co.uk'
    click_button 'Submit'
    expect(page).to have_content('BBC news')
  end
end
