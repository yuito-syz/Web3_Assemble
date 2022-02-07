json.extract! post, :id, :title, :body, :user_id, :created_at, :updated_at
json.user_name post.user.name