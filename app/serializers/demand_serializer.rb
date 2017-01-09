class DemandSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :theme_id, :title, :description, :cost, :location, :photo
end
