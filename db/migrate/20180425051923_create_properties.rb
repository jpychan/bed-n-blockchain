class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.integer :price, null: false
      t.string :name, null: false
      t.integer :type, default: 0
      t.string :location, null: false
      t.integer :capacity, default: 1
      t.string :image_url
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
