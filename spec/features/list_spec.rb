feature 'Viewing links' do
  scenario 'user sees list of links on homepage' do
    sign_up
    create_link_with_tag
    within 'ul#links' do
      expect(page).to have_content('Test Item')
    end
  end
end
