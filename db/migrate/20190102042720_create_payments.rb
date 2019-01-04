class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :transaction_id
      t.string :payment_type

      t.timestamps
    end
  end
end
