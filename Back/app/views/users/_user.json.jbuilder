json.extract! user, :id, :user_name, :password, :nb_skilly, :integer, :first_name, :string, :last_name, :string, :email, :string, :location, :string, :age, :integer, :photo, :string, :created_at, :updated_at
json.url user_url(user, format: :json)