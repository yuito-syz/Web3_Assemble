require 'rails_helper'

RSpec.describe User, type: :system do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    describe 'User CRUD' do
        describe 'ログイン前' do
            describe 'ユーザー新規登録' do

            end
        end
        describe 'ログイン後' do
            describe 'ユーザー編集'
        end
    end
end