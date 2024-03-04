# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Bookings', type: :request do
  let(:user) { create(:user) }

  describe 'POST /api/v1/users/:user_id/bookings' do
    it 'creates a new booking and returns a success response' do
      hotel = create(:hotel)
      booking_params = { no_of_rooms: 2, check_in_date: '2024-03-01', check_out_date: '2024-03-05', hotel_id: hotel.id }

      post "/api/v1/users/#{user.id}/bookings", params: booking_params

      expect(response).to have_http_status(:created)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['success']).to be_truthy
      expect(parsed_response['data']['booking']).not_to be_nil
    end
  end

  describe 'GET /api/v1/users/:user_id/bookings' do
    it 'returns a success response with user bookings' do
      create_list(:booking, 3, user:)

      get "/api/v1/users/#{user.id}/bookings"

      expect(response).to have_http_status(:ok)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['success']).to be_truthy
      expect(parsed_response['data']['bookings'].count).to eq(3)
    end
  end

  describe 'GET /api/v1/users/:user_id/bookings/:id' do
    it 'returns a success response with a specific booking' do
      booking = create(:booking, user:)

      get "/api/v1/users/#{user.id}/bookings/#{booking.id}"

      expect(response).to have_http_status(:ok)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['success']).to be_truthy
      expect(parsed_response['data']['booking']['id']).to eq(booking.id)
    end
  end

  describe 'PUT /api/v1/users/:user_id/bookings/:id' do
    it 'updates a booking and returns a success response' do
      booking = create(:booking, user:)
      updated_params = { no_of_rooms: 3, check_in_date: '2024-03-02', check_out_date: '2024-03-06' }

      put "/api/v1/users/#{user.id}/bookings/#{booking.id}", params: updated_params

      expect(response).to have_http_status(:ok)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['success']).to be_truthy
      expect(parsed_response['data']['booking']['no_of_rooms']).to eq(3)
    end
  end

  describe 'DELETE /api/v1/users/:user_id/bookings/:id' do
    it 'deletes a booking and returns a success response' do
      booking = create(:booking, user:)

      delete "/api/v1/users/#{user.id}/bookings/#{booking.id}"

      expect(response).to have_http_status(:no_content)
      booking.reload
      expect(booking.status).to eq('cancelled')
    end
  end
end
