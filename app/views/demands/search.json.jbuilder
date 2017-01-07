if @demands.nil?
    json.set! :status, 'Error 404 : not found'
elsif
    json.array! @demands.each do |dem|
        json.id dem.id
        json.user_id dem.user_id
        json.theme_id dem.theme_id
        json.title dem.title
        json.description dem.description
        json.cost dem.cost
        json.location dem.location
        json.photo dem.photo
    end
end