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
end