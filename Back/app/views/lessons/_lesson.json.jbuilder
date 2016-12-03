json.extract! lesson, :id, :course_id, :dem_id, :date, :cost, :status, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)