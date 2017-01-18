if @user.nil?
	then
    json.set! :error, 'Error 404'
elsif
    json.extract! @user, :id, :first_name, :last_name, :description, :email, :phone_number, :nb_skilly, :birth_date, :location, :photo, :verif, :created_at, :updated_at
end    