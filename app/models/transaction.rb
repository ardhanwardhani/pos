class Transaction < ApplicationRecord
	include AASM

	has_many :transaction_items
	has_one :payment

	belongs_to :member, :optional => true

	aasm :column => 'status' do
		state :pending, :initial => true
		state :save, :pay

		event :save_trans do
			transitions :from => :pending, :to => :save
		end

		event :pay_trans do
			transitions :from => [:pending, :save], :to => :pay
		end
	end
end
