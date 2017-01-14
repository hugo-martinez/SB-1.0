if @notifs.nil?
    json.set! :error, 'Error 404 : not found'
elsif
    json.array! @notifs.each do |noti|
        json.id noti.id
        json.user_id noti.user_id
        json.title noti.title
        json.msg noti.msg
        json.time noti.created_at
        json.status noti.status
        json.url noti.url
    end
end