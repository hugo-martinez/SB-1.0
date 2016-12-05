json.extract! course, :id, :user_id, :theme_id, :title, :description, :cost, :location, :photo, :created_at, :updated_at
json.url course_url(course, format: :json)