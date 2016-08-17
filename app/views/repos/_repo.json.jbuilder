json.extract! repo, :id, :name, :description, :readme, :created_at, :updated_at
json.url repo_url(repo, format: :json)