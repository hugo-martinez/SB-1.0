if @messages.nil?
    json.set! :error, 'Error 404 : not found'
elsif
    json.array! @messages.each do |mes|
        json.id mes.id
        json.user_id mes.user_id
        json.msg mes.msg
        json.time mes.created_at
    end
end