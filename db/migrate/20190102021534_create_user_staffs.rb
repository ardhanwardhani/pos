class CreateUserStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_staffs do |t|
      t.integer :employee_id

      t.timestamps
    end
  end
end
