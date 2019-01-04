class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :member_id
      t.string :total

      t.timestamps
    end
  end
end
