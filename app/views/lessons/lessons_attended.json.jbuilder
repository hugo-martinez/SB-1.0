if @lessons.nil?
    json.set! :error, 'Error 404 : not found'
elsif
    json.array! @lessons.each do |les|
        json.id les.id
        json.course_origin les.course_origin
        json.teacher_id les.teacher_id
        json.pupil_id les.pupil_id
        json.type_match_id les.origin_id
        json.date les.date
        json.location les.location
        json.cost les.cost
        json.evolution les.evolution
    end
end