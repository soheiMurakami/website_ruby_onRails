json.extract! movieupload, :id, :name, :rating, :description, :created_at, :updated_at
json.url movieupload_url(movieupload, format: :json)
