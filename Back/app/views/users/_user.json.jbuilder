json.extract! user, :id, :user_name, :password, :nb_skilly, :first_name, :last_name, :email, :location, :age, :photo, :created_at, :updated_at
json.url user_url(user, format: :json)