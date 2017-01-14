json.extract! user, :id, :first_name, :last_name, :password, :email, :phone_number, :nb_skilly, :birth_date, :location, :photo, :verif, :created_at, :updated_at
json.url user_url(user, format: :json)