class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.integer :order_id

      t.timestamps
    end
  end
end
