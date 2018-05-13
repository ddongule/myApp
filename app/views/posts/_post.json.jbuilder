json.extract! post, :id, :name, :title, :content, :created_at, :updated_at
json.url show_post_url(post, format: :json)
