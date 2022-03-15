class User < ApplicationRecord
    # Include default devise modules.
    devise  :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable, :omniauthable
            ## :confirmable
    include DeviseTokenAuth::Concerns::User

    has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy

    has_many :followings, through: :relationships, source: :followed
    has_many :followers, through: :reverse_of_relationships, source: :follower

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

end
