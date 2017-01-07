if @user.nil?
	then
    json.set! :error, 'Error 404'
elsif
    json.extract! @user, :id, :user_name, :password, :nb_skilly, :first_name, :last_name, :email, :phone_number, :location, :age, :photo, :created_at, :updated_at
end    