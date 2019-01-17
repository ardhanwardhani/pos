class Transaction < ApplicationRecord
	include AASM

	has_many :transaction_items
	has_one :payment

	belongs_to :member, :optional => true
	belongs_to :operatorable, :polymorphic => true
	belongs_to :outlet

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

	def fill_field_data(outlet, operator, current_user, last)
		self.total = 0
		self.user_id = current_user.id
		self.outlet_id = outlet.id
		self.operatorable_type = operator.class.name
		self.operatorable_id = operator.id
		if last.nil?
      self.id_transaction = "TRX-1"
    else
      kode = last.id_transaction[4..6]
      kode = kode.to_i + 1
      self.id_transaction = "TRX-" + kode.to_s
    end
	end
end
