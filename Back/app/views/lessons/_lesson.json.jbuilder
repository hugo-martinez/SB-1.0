json.extract! lesson, :id, :teach_id, :integer, :pupil_id, :integer, :date, :cost, :integer, :status, :integer, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)