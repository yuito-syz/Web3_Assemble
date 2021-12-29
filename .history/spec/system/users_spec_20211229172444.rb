require 'rails_helper'

RSpec.describe User, type: :system do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    describe 'User CRUD' do
        describe 'Before login' do
            describe 'User registration' do
                context 'Form input values are normal' do
                    it 'Successfully created a new user' do
                        visit sign_up_path
                        fill_in 'Email', with: 'test@example.com'
                        fill_in 'Password', with: 'password'
                        fill_in 'Password confirmation', with: 'password'
                        click_button 'SignUp'
                        expect(current_path).to eq login_path
                        expect(page).to have_content 'User was successfully created.'
                    end
                end
                context 'Email address not filled in' do
                    it 'Failed to create a new user.' do
                        visit sign_up_path
                        fill_in 'Email', with: nil
                        fill_in 'Password', with: 'password'
                        fill_in 'Password confirmation', with: 'password'
                        click_button 'SignUp'
                        expect(current_path).to eq users_path
                        expect(page).to have_content "Email can't be blank"
                    end
                end
                context 'Registered email address' do
        
                end
            end
        end
        describe 'After login' do
            describe 'User editing'
                context 'Form input values are normal' do

                end
                context 'Email address not filled in' do
        
                end
        end
    end
end