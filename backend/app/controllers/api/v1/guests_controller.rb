class Api::V1::GuestsController < ApplicationController
  def create
    random_value = SecureRandom.hex(1)
    random_pass = SecureRandom.hex(4)
    user_params = {
      name: "guest_#{random_value}",
      email: "guest_#{random_value}@guest.com",
      password: "#{random_pass}",
      password_confirmation: "#{random_pass}"
    }
    user = User.create!(user_params)
    render json: { email: user.email, password: user.password }
  end

  def delete
  end
end
