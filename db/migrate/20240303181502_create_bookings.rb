# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :user_name
      t.integer :no_of_rooms
      t.date :check_in_date
      t.date :check_out_date
      t.references :hotel, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
