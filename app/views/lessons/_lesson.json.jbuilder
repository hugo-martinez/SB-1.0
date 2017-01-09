json.extract! lesson, :id, :course_origin, :teacher_id, :pupil_id, :origin_id, :date, :location, :cost, :evolution, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)