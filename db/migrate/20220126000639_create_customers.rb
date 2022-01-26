class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :vehicle_name
      t.string :vehicle_type
      t.integer :vehicle_length

      t.timestamps
    end
  end
end
