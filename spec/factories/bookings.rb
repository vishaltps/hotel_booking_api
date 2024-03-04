# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    user { create(:user) }
    hotel { create(:hotel) }
    no_of_rooms { 1 }
    check_in_date { Date.today }
    check_out_date { Date.today + 2.days }
    status { 'confirmed' }
  end
end
