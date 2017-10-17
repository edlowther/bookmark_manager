feature 'Viewing links' do
  scenario 'user sees list of links on homepage' do
    Link.create(
      :title      => "Makers Academy on GitHub",
      :url       => "https://github.com/makersacademy/",
      :created_at => Time.now
    )
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy on GitHub')
    end
  end
end
