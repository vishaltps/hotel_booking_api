# frozen_string_literal: true

class AddStatusToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :status, :int
  end
end
