require 'rails_helper'

RSpec.describe User, type: :system do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    describe 'User CRUD' do
        describe 'Before login' do
            describe 'User registration' do
                context 'Form input values are normal' do
                    it 'Successfully created a new user' do
                        visit signup_path
                        fill_in 'Email', with: 'test@example.com'
                        fill_in 'Password', with: 'password'
                        fill_in 'Confirmation', with: 'password'
                        click_button 'Create my account'
                        expect(current_path).to eq login_path
                        expect(page).to have_content 'User was successfully created.'
                    end
                end
                context 'Email address not filled in' do
                    it 'Failed to create a new user.' do
                        visit signup_path
                        fill_in 'Email', with: nil
                        fill_in 'Password', with: 'password'
                        fill_in 'Confirmation', with: 'password'
                        click_button 'Create my account'
                        expect(current_path).to eq users_path
                        expect(page).to have_content "Email can't be blank"
                    end
                end
                context 'Registered email address' do
                    it 'Creating a new user fails.' do
                        visit signup_path
                        fill_in 'Email', with: user.email
                        fill_in 'Password', with: 'password'
                        fill_in 'Confirmation', with: 'password'
                        click_button 'Create my account'
                        expect(current_path).to eq users_path
                        expect(page).to have_content "Email has already been taken"
                    end
                end
            end
        end
        describe 'After login' do
            describe 'User editing'
                context 'Form input values are normal' do
                    it 'Successful editing of user.' do
                        visit edit_user_path(user)
                        fill_in 'Email', with: 'test@example.com'
                        fill_in 'Password', with: 'test'
                        fill_in 'Password confirmation', with: 'test'
                        click_button 'Update'
                        expect(current_path).to eq user_path(user)
                        expect(page).to have_content 'User was successfully updated.'
                    end
                end
                context 'Email address not filled in' do
                    it 'Failed to edit user.' do
                        visit edit_user_path(user)
                        fill_in 'Email', with: nil
                        fill_in 'Password', with: 'password'
                        fill_in 'Password confirmation', with: 'password'
                        click_button 'Update'
                        expect(current_path).to eq user_path(user)
                        expect(page).to have_content "Email can't be blank"
                    end
                end
        end
    end
end