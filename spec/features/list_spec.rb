feature 'Viewing links' do
  scenario 'user sees list of links on homepage' do
    # Link.create(
    #   :title      => "Makers Academy on GitHub",
    #   :url        => "https://github.com/makersacademy/",
    #   :created_at => Time.now
    # )
    create_link_with_tag
    within 'ul#links' do
      expect(page).to have_content('Test Item')
    end
  end
end
