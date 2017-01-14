json.extract! notif, :id, :user_id, :title, :msg, :status, :url, :created_at, :updated_at
json.url notif_url(notif, format: :json)