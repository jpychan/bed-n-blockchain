class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :property, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
