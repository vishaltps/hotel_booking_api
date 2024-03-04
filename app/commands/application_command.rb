# frozen_string_literal: true

class ApplicationCommand
  def validation_error(errors)
    Result.new(success: false, error_message: errors)
  end
end
