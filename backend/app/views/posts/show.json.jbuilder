## json.partial! "posts/post", post: @post

json.post do
    json.extract! @post, :id, :content, :updated_at
end