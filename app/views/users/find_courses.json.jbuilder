if @courses.nil?
	then
    json.set! :error, 'Error 404'
elsif
    json.partial! "courses/course", course: @courses