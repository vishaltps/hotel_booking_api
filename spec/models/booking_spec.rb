# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'associations' do
    it { should belong_to(:hotel) }
    it { should belong_to(:user) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(%i[pending confirmed cancelled rejected]) }
  end
end
