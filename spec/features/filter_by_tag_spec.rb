feature 'Filter by tag' do
  scenario 'user can search links by a specific tag' do
    sign_up
    create_link_with_tag
    create_link_with_bubble_tag
    visit '/tags/bubbles'
    expect(page).not_to have_content 'testtag'
    expect(page).to have_content 'bubbles'
  end
end
