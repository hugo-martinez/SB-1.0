if @course.nil?
	then
    json.set! :error, 'Error 404'
elsif
    json.extract! @course, :id, :user_id, :theme_id, :title, :description, :cost, :photo, :location
end   