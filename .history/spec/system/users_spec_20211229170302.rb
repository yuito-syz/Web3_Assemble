require 'rails_helper'

RSpec.describe User, type: :system do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    describe 'User CRUD' do
        describe 'ログイン前' do
            describe 'ユーザー新規登録' do
                context 'フォームの入力値が正常' do

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