class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.integer :price, null: false
      t.string :name, null: false
      t.integer :property_type, default: 0
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.integer :capacity, default: 1
      t.string :image
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
