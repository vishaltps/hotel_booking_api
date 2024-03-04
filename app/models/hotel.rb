# frozen_string_literal: true

class Hotel < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
