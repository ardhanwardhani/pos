class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :outlets
  has_one :bussiness
  has_many :members
  has_many :suppliers
  has_many :employees
  has_many :products
  has_many :varians
  has_one :image, :as => :imageable
  has_many :income_stocks, :as => :authable
  has_many :outcome_stocks, :as => :authable
  has_many :purchase_orders, :as => :authable

  validates :name, presence: true
  validates :email, presence: true
  validates :telephone, presence: true
  validates :province, presence: true
  validates :city, presence: true
  validates :pin, length: { is: 4 }

  def cek_pin(user, pin_cashier)
    user.pin = pin_cashier.to_s
  end


  after_create :data

  private

  def data
    bussiness = Bussiness.create(user_id: self.id, name: self.name, email: self.email, telephone: self.telephone, province: self.province, city: self.city)
    outlet = Outlet.create(user_id: self.id, name: 'Outlet 1', address: self.city, city: self.city, telephone: self.telephone)
  end
end
