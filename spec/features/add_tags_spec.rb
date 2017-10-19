feature 'Add tags' do
  scenario 'user can add a tag to a new link' do
    create_link_with_tag
    expect(page).to have_content 'testtag'
  end
  scenario 'duplicate tags are not created' do
    create_link_with_tag
    create_link_with_tag
    expect(Tag.all(:name => 'testtag').length).to eq 1
  end
  scenario 'user can enter multiple tags for a link' do
    create_link_with_tag
    click_on 'Add new tag'
    fill_in 'tag',  with: 'bubbles'
    click_button 'Done'
    expect(page).to have_content 'testtag, bubbles'
  end
end
