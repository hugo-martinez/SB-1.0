class NotifSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :msg, :status, :url
end
