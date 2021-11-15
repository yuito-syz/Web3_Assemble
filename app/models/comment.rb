class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  validates :content, { presence: true, length: { maximum: 100 } }
  validates :user_id, { presence: true }
  validates :micropost_id, { presence: true }
end
