# frozen_string_literal: true

module Api
  module V1
    class BookingsController < ApplicationController
      def create
        result = Bookings::Create.new(booking_params, current_user).call
        if result.success
          render_success_response(
            data: { booking: result.data },
            status: 201
          )
        else
          render_error_response(result.error_message)
        end
      end

      def index
        data = Bookings::Fetch.new(filter_params, current_user).call
        render_success_response(data: { bookings: data })
      end

      def show
        booking = current_user.bookings.find(params[:id])
        render_success_response(data: { booking: })
      end

      def update
        result = Bookings::Update.new(booking_params, current_user).call
        render_success_response(data: { booking: result.data })
      end

      def destroy
        Bookings::Destroy.new(params, current_user).call
        render_success_response(status: 204)
      end

      private

      def booking_params
        params.permit(:id, :no_of_rooms, :check_in_date, :check_out_date, :hotel_id)
      end

      def filter_params
        params.permit(:status)
      end
    end
  end
end
