require 'rails_helper'

RSpec.describe User, type: :system do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
end