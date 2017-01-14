class MessageSerializer < ActiveModel::Serializer
  attributes :id, :conv_id, :user_id, :msg
end
