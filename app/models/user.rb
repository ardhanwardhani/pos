class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :outlets
  has_one :bussinesses
  has_many :members
  has_many :suppliers
  has_many :employees
  has_many :products
  has_many :varians
  has_one :image, :as => :imageable
end
