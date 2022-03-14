5.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}",
    password: "localhost_password"
  )
end
  
puts "users = #{User.count}"