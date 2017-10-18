feature 'Add tags' do
  scenario 'I can add a tag to a new link' do
    create_link_with_tag
    expect(page).to have_content 'testtag'
  end
end
