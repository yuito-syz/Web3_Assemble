class User < ApplicationRecord
    devise  :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable, :omniauthable
            ## :confirmable
    include DeviseTokenAuth::Concerns::User

    has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
    has_many :following, through: :following_relationships
    has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
    has_many :followers, through: :follower_relationships

    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    def my_json
        as_json(only: [:id, :name, :email, :created_at])
    end

    def self.guest
        find_or_create_by!(email: "guest@example.com") do |user|
          user.password = SecureRandom.urlsafe_base64
          user.name = "ゲストユーザー"
        end
    end

    def following?(user)
        following_relationships.find_by(following_id: user.id)
    end

    def follow(user)
        following_relationships.create!(following_id: user.id)
    end

    def unfollow(user)
        following_relationships.find_by(following_id: user.id).destroy
    end

    def self.search(keyword)
        where(["name like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
    end

end
