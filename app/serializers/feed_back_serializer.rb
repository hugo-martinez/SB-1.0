class FeedBackSerializer < ActiveModel::Serializer
  attributes :id, :lessons_id, :feed_backer_id, :note, :comment
end
