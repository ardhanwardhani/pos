class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.integer :pin
      t.string :type_employee

      t.timestamps
    end
  end
end
