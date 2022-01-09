require 'rails_helper'

RSpec.describe "UsersLogins", type: :system do
    let(:user) { FactoryBot.create(:user) }

    scenario 'Don\'t login when user submits invalid information' do
        visit login_path
        fill_in 'Email', with: ' '
        fill_in 'Password', with: ' '
        click_button 'Log in'
        aggregate_failures do
            expect(current_path).to eq login_path
            expect(has_css?('.alert-danger')).to be_truthy
            visit current_path
            expect(has_css?('.alert-danger')).to be_falsy
        end
    end

    scenario 'login succeeds when user submits valid information' do
        visit login_path
        fill_in 'Email',    with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
        aggregate_failures do
          expect(current_path).to eq root_path
          expect(page).to have_link 'Log in'
          expect(find(".dropdown")).to have_link 'Log out', href: logout_path
          expect(page).to have_no_link 'Profile', href: user_path(user)
        end
        click_button 'Log out'
        aggregate_failures do
          expect(current_path).to eq root_path
          expect(page).to have_no_link 'Log in', href: login_path
          expect(page).to have_no_link 'Log out'
          expect(page).to have_no_link 'Profile'
        end
    end
end