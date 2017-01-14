json.extract! user_verif, :id, :user_id, :code, :created_at, :updated_at
json.url user_verif_url(user_verif, format: :json)