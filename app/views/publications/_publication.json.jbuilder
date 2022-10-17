json.extract! publication, :id, :title, :description, :route, :price, :user_id, :created_at, :updated_at
json.url publication_url(publication, format: :json)
