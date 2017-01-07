if @courses.nil?
    json.set! :status, 'Error 404 : not found'
elsif
    json.array! @courses.each do |cours|
        json.id cours.id
        json.user_id cours.user_id
        json.theme_id cours.theme_id
        json.title cours.title
        json.description cours.description
        json.cost cours.cost
        json.location cours.location
        json.photo cours.photo
    end
end