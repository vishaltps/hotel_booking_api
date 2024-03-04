# frozen_string_literal: true

module Hotels
  class Fetch
    attr_reader :filter_params

    def initialize(filter_params)
      @filter_params = filter_params
    end

    def call
      records = Hotel.all
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
