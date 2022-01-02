FactoryBot.define do
    factory :user do
      name { "TestUser" }
      email { "user@email.com" }
      password { 'foobar' }
      password_confirmation { 'foobar' }
    end
end