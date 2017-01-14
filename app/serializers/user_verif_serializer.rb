class UserVerifSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :code
end
