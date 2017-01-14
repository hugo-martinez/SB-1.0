if @user.nil?
	then
    json.set! :status, 'Not Activated'
elsif
	json.set! :status, 'Activated'
end    