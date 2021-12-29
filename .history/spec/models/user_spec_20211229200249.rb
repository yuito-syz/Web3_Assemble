require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  it 'should be valid' do
    expect(user).to be_valid
  end

  it 'is invalid with no name' do
    user.name = ' '
    expect(user).to be_invalid
  end

  it 'is invalid with no mail' do
    user.mail = ' '
    expect(user).to be_invalid
  end

  it 'is invalid with 51-letter names' do
    user.name = 'a' * 51
    expect(user).to be_invalid
  end

  it 'is invalid with 256-letter mails' do
    user.name = 'a' * 244 + 'example.com'
    expect(user).to be_invalid
  end
end