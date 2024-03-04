# frozen_string_literal: true

module Api
  module V1
    class HotelsController < ApplicationController
      def index
        data = Hotels::Fetch.new(filter_params).call
        render_success_response(data: { hotels: data })
      end

      private

      def filter_params
        params.permit(:location, hotel: {})
      end
    end
  end
end
