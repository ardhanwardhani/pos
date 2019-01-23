class ProductSerializer < ActiveModel::Serializer
  attributes :id, :product_number, :barcode, :name, :price, :category_id, :status, :image, :varians

  # def varians
  # 	attributes :id, :product_number, :barcode, :name, :price
  # end
end
