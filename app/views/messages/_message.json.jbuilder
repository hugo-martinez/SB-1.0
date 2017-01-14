json.extract! message, :id, :conv_id, :user_id, :msg, :created_at, :updated_at
json.url message_url(message, format: :json)