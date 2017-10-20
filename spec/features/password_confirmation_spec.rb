feature 'Password confirmation' do
  scenario 'non-matching password confirmation does not generate new user' do
    visit '/users/new'
    fill_in 'name', with: "Bob"
    fill_in 'email', with: 'bob@hotmail.com'
    fill_in 'password', with: 'very hard to decipher word'
    fill_in 'password_confirmation', with: 'less hard to decipher word'
    click_button 'Create account'
    expect(Person.all.length).to eq 0
  end
end
