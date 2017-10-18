def create_link_with_tag
  visit '/links/new'
  fill_in 'url',   with: 'http://test.com'
  fill_in 'title', with: 'Test Item'
  fill_in 'tag',  with: 'testtag'
  click_button 'Submit'
end