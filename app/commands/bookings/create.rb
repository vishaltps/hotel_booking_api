# frozen_string_literal: true

module Bookings
  class Create < ApplicationCommand
    attr_reader :current_user, :params, :contract

    def initialize(params, current_user)
      @params = params
      @current_user = current_user
      @contract = ::Bookings::CreateContract.new.call(params.to_h)
    end

    def call
      return validation_error(contract.errors.to_h) if contract.failure?

      booking = current_user.bookings.create!(params.merge(status: 'confirmed'))
      Result.new(success: true, data: booking)
    end
  end
end
