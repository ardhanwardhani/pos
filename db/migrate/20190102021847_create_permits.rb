class CreatePermits < ActiveRecord::Migration[5.1]
  def change
    create_table :permits do |t|
      t.integer :employee_id
      t.integer :outlet_id
      t.string :permitable_type
      t.integer :permitable_id
      t.string :permit_android
      t.string :permit_backoffice

      t.timestamps
    end
  end
end
