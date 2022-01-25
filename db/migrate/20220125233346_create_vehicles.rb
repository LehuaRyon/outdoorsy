class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.integer :length
      t.string :type
      t.belongs_to :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
