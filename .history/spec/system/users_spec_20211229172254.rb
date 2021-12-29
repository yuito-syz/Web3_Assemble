require 'rails_helper'

RSpec.describe User, type: :system do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    describe 'User CRUD' do
        describe 'Before login' do
            describe 'User registration' do
                context 'Form input values are normal.' do
                    it 'ユーザーの新規作成が成功' do
                    visit sign_up_path
                    fill_in 'Email', with: 'test@example.com'
                    fill_in 'Password', with: 'password'
                    fill_in 'Password confirmation', with: 'password'
                    click_button 'SignUp'
                    expect(current_path).to eq login_path
                    expect(page).to have_content 'User was successfully created.'
                end
                context 'Email address not filled in' do
        
                end
                context 'Registered email address' do
        
                end
            end
        end
        describe 'After login' do
            describe 'User editing'
                context 'Form input values are normal.' do

                end
                context 'Email address not filled in' do
        
                end
        end
    end
end