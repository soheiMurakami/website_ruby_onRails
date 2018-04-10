json.extract! csvupload, :id, :name, :rating, :description, :created_at, :updated_at
json.url csvupload_url(csvupload, format: :json)
