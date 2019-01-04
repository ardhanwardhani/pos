class Bussiness < ApplicationRecord
	 has_one :image, :as => :imageable

	 belongs_to :user
end
