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
  has_many :income_stocks, :as => :authable
  has_many :outcome_stocks, :as => :authable
  has_many :purchase_orders, :as => :authable
  has_many :transactions
  has_many :transactions, :as => :operatorable


  validates :name, presence: true
  validates :email, presence: true
  validates :telephone, presence: true
  validates :province, presence: true
  validates :city, presence: true
  validates :pin, length: { is: 4 }

  def cek_pin(pin_cashier)
    self.pin == pin_cashier.to_i
  end

  def generate_access_token
    token = SecureRandom.hex(10)
    self.update(access_token: token, access_token_created_at: Time.zone.now)
    token
  end

  def invalidate_access_token
    self.update(access_token: nil, access_token_created_at: nil)
  end

  after_create :data

  private

  def data
    bussiness = Bussiness.create(user_id: self.id, name: self.name, telephone: self.telephone, province: self.province, city: self.city)
    outlet = Outlet.create(user_id: self.id, name: 'Outlet 1', address: self.city, city: self.city, telephone: self.telephone)
  end
end
