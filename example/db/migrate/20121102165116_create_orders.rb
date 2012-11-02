class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :description
      t.string :status
      t.integer :customer_id

      t.timestamps
    end
  end
end
