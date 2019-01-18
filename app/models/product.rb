class Product < ApplicationRecord
	include AASM
	# Dijual = 0, Tidak dijual = 1

	mount_uploader :image, ImageUploader

	has_many :varians
	has_many :income_items, :as => :itemable
	has_many :outcome_items, :as => :itemable
	has_many :purchase_order_items, :as => :itemable
	has_many :transaction_items, :as => :itemable

	belongs_to :category, :optional => true

	serialize :group_varians, Hash
	
	after_create :product_hash

	aasm :column => 'status' do
		state :on_sale, :initial => true
		state :not_sold

		event :sale do
			transitions :from => :not_sold, :to => :on_sale
		end

		event :not_sale do
			transitions :from => :on_sale, :to => :not_sold
		end
	end

	def product_hash
		hsh = self.group_varians
		if hsh.present?
	  	attrs   = hsh.values
	  	keys    = hsh.keys
	  	product = attrs[0].product(*attrs[1..-1])
	  	varians = product.map{ |p| Hash[keys.zip p] }

	  	varians.each do |v|
	  		name_varian = v.values.join(" ")
	  		@varian = Varian.create(product_id: self.id, name: name_varian, user_id: self.user_id)
  		end
  	end
	end
end
