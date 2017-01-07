class LessonSerializer < ActiveModel::Serializer
  attributes :id, :course_origin, :teacher_id, :pupil_id, :origin_id, :date, :location, :cost, :evolution
end
