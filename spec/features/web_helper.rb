def create_link_with_tag
  visit '/links/new'
  fill_in 'url',   with: 'http://test.com'
  fill_in 'title', with: 'Test Item'
  fill_in 'tag',  with: 'testtag'
  click_button 'Submit'
end

def create_link_with_bubble_tag
  visit '/links/new'
  fill_in 'url',   with: 'http://test.com'
  fill_in 'title', with: 'Bubbl-es'
  fill_in 'tag',  with: 'bubbles'
  click_button 'Submit'
end
