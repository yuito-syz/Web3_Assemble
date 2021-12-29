require 'rails_helper'

RSpec.describe User, type: :system do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    describe 'User CRUD' do
        describe 'Before login' do
            describe 'User registration' do
                context 'Form input values are normal.' do
                    # ユーザー新規登録画面へ遷移
                    visit sign_up_path
                    # Emailテキストフィールドにtest@example.comと入力
                    fill_in 'Email', with: 'test@example.com'
                    # Passwordテキストフィールドにpasswordと入力
                    fill_in 'Password', with: 'password'
                    # Password confirmationテキストフィールドにpasswordと入力
                    fill_in 'Password confirmation', with: 'password'
                    # SignUpと記述のあるsubmitをクリックする
                    click_button 'SignUp'
                    # login_pathへ遷移することを期待する
                    expect(current_path).to eq login_path
                    # 遷移されたページに'User was successfully created.'の文字列があることを期待する
                    expect(page).to have_content 'User was successfully created.'
                end
                context 'メールアドレス未記入' do
        
                end
                context '登録済メールアドレス' do
        
                end
            end
        end
        describe 'ログイン後' do
            describe 'ユーザー編集'
                context 'フォームの入力値が正常' do

                end
                context 'メールアドレス未記入' do
        
                end
        end
    end
end