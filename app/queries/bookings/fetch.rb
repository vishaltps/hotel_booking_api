# frozen_string_literal: true

module Bookings
  class Fetch
    attr_reader :filter_params, :current_user

    def initialize(filter_params, current_user)
      @filter_params = filter_params
      @current_user = current_user
    end

    def call
      records = current_user.bookings.where.not(status: :cancelled)
      return records if filter_params.blank?

      filter_records(records)
    end

    private

    def filter_records(records)
      filter_params.each do |key, value|
        records = records.where(key => value)
      end
      records
    end
  end
end
