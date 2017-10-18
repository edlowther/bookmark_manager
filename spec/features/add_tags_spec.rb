feature 'Add tags' do
  scenario 'I can add a tag to a new link' do
    # visit '/links/new'
    # fill_in 'url',   with: 'http://test.com'
    # fill_in 'title', with: 'Test Item'
    # fill_in 'tag',  with: 'testtag'
    # click_button 'Submit'

    create_link_with_tag
    expect(page).to have_content 'testtag'
  end
end