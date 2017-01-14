json.extract! conversation, :id, :user_id1, :user_id2, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)