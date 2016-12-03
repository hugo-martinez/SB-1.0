json.extract! dispo_course, :id, :course_id, :date, :created_at, :updated_at
json.url dispo_course_url(dispo_course, format: :json)