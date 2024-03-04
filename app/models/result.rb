# frozen_string_literal: true

class Result
  attr_reader :success, :data, :error_message

  def initialize(success:, data: nil, error_message: nil)
    @success = success
    @data = data
    @error_message = error_message
  end
end
