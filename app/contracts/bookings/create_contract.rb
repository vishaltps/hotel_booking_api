# frozen_string_literal: true

module Bookings
  class CreateContract < ApplicationContract
    params do
      required(:no_of_rooms).filled(:integer)
      required(:hotel_id).filled(:integer)
      required(:check_in_date).filled(:string)
      required(:check_out_date).filled(:string)
    end

    rule(:check_out_date, :check_in_date) do
      next if Date.parse(values[:check_out_date]) >= Date.parse(values[:check_in_date])

      key(:check_out_date).failure('must be after check-in date')
    end
  end
end
