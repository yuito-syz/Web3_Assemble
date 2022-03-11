require "validator/email_validator"

class User < ApplicationRecord
    include UserAuth::Tokenizable
    before_validation :downcase_email
    has_secure_password

    has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy

    has_many :followings, through: :relationships, source: :followed
    has_many :followers, through: :reverse_of_relationships, source: :follower

    validates :name, presence: true,
                   length: { maximum: 30, allow_blank: true }
    validates :email, presence: true,
                   email: { allow_blank: true }
    VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
    validates :password, presence: true,
                        length: { minimum: 8 },
                        format: {
                            with: VALID_PASSWORD_REGEX,
                            message: :invalid_password
                        },
                        allow_nil: true
    class << self
        def find_activated(email)
            find_by(email: email, activated: true)
        end
    end

    def email_activated?
        users = User.where.not(id: id)
        users.find_activated(email).present?
    end

    def my_json
        as_json(only: [:id, :name, :email, :created_at])
    end

    def follow(user_id)
        relationships.create(followed_id: user_id)
    end

    def unfollow(user_id)
        relationships.find_by(followed_id: user_id).destroy
    end

    def following?(user)
        followings.include?(user)
    end

    def self.search(keyword)
        where(["name like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
    end

    private
    
    def downcase_email
      self.email.downcase! if email
    end
end
