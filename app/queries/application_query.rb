# frozen_string_literal: true

def filter_records(records)
  filter_params.each do |key, value|
    records = records.where(key => value)
  end
  records
end
