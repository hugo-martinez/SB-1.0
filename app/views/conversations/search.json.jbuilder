if @conv.nil?
    json.set! :error, 'Error 404 : not found'
elsif
    json.array! @conv.each do |cn|
        json.id cn.id
        json.user_id1 cn.user_id1
        json.user_id2 cn.user_id2
        json.created_at cn.created_at
    end
end