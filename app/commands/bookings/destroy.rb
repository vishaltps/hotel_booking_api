# frozen_string_literal: true

module Bookings
  class Destroy < ApplicationCommand
    attr_reader :params, :current_user

    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def call
      booking.update!(status: 'cancelled')

      Result.new(success: true, data: booking)
    end

    def booking
      @booking ||= current_user.bookings.find(params[:id])
    end
  end
end
