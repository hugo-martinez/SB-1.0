json.extract! demand, :id, :user_id, :theme_id, :title, :description, :cost, :location, :photo, :created_at, :updated_at
json.url demand_url(demand, format: :json)