# frozen_string_literal: true

class BookingSerializer < ActiveModelSerializers::Model
  attributes :id, :no_of_rooms, :check_in_date, :check_out_date, :status, :user, :hotel

  belongs_to :user
  belongs_to :hotel
end
