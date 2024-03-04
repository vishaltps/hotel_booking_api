# frozen_string_literal: true

module Bookings
  class Update < ApplicationCommand
    attr_reader :current_user, :params

    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def call
      booking.update!(params)
      Result.new(success: true, data: booking)
    end

    def booking
      @booking ||= current_user.bookings.find(params[:id])
    end
  end
end
