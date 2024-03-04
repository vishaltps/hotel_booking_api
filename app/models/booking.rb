# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :hotel
  belongs_to :user

  enum :status, %i[pending confirmed cancelled rejected]
end
