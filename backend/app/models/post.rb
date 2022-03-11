class Post < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy

    def self.search(keyword)
        where(["content like?", "%#{keyword}%"])
    end
end
