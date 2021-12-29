require 'rails_helper'

RSpec.describe "UsersSignups", type: :system do
  scenario 'Don\'t create new data when user submits invalid information' do
    visit signup_path
    fill_in 'Name', with: ' '
    fill_in 'Email', with: 'user@invalid'
    fill_in 'Password', with: 'foo'
    fill_in 'Confirmation', with: 'bar'
    click_on 'Create my account'
    aggregate_failures do
      expect(current_path).to eq users_path
      expect(page).to have_content 'Sign up'
      expect(page).to have_content 'The form contains 4 errors'
    end
  end
end