FactoryBot.define do
    factory :user do
      provider                    { 'email' }
      uid                         { Faker::Internet.safe_email }
      password                    { Faker::Internet.password }
      email                       { uid }
      name                        { Gimei.name }
    end
end