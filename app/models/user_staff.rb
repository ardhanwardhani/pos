class UserStaff < ApplicationRecord
	belongs_to :employee
	has_many :permits, :as => :permitable
	has_many :outlet, :through => :permit
	has_many :income_stocks, :as => :authable
  has_many :outcome_stocks, :as => :authable
  has_many :purchase_orders, :as => :authable
end
