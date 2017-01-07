if @course.nil?
	then
    json.set! :error, 'Error 404'
elsif
	tab =[]
	@course.each do |cours|
    tab << json.extract! cours, :id, :user_id, :theme_id, :title, :description, :cost, :photo, :location
    return tab
end
end   
