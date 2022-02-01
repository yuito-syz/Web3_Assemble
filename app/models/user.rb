class User < ApplicationRecord
  TOKEN_VALIDATION_RESPONSE_ATTRS = [
    :otp_required_for_login,
    :id,
    :provider,
    :email,
    :uid,
    :name,
    :nickname,
    :image
  ]
  devise :two_factor_authenticatable,
         :otp_secret_encryption_key => Rails.application.credentials.devise_two_factor[:ENCRYPTION_KEY]

  # Include default devise modules.
  devise :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  attr_accessor :remember_token, :activation_token, :reset_token
  has_many :likes, dependent: :destroy
  
  # ユーザーのステータスフィードを返す
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids}) OR user_id = :user_id",  
      following_ids: following_ids, user_id: id)
  end
  
  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  # 省略
  def token_validation_response
    self.as_json(only: TOKEN_VALIDATION_RESPONSE_ATTRS)
  end

end
