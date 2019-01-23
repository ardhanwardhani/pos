class OutletSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :telephone
end
