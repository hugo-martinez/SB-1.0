json.extract! dispo_user, :id, :user_id, :dispo, :created_at, :updated_at
json.url dispo_user_url(dispo_user, format: :json)