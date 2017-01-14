class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :password, :email, :phone_number, :nb_skilly, :birth_date, :location, :photo, :verif
end
