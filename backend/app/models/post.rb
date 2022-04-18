class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    enum status: { published: 0, draft: 1 }

    def liked_by?(user)
        likes.where(user_id: user.id).exists?
    end

    def self.search(keyword)
        where(["content like?", "%#{keyword}%"])
    end
end
