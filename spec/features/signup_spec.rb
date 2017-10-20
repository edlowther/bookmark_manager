feature 'Signing up' do
  scenario 'user is able to create account' do
    sign_up
    create_link_with_tag
    expect(page).to have_content 'Added by bob@hotmail.com'
  end
end
