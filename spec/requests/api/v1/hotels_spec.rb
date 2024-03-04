# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Hotels', type: :request do
  describe 'GET /api/v1/hotels' do
    let(:params) { { location: 'Mumbai' } }
    it 'returns a success response' do
      get '/api/v1/hotels'
      expect(response).to have_http_status(:ok)
    end

    it 'calls Hotels::Fetch service with correct parameters' do
      # expect(Hotels::Fetch).to receive(:new).with(request.params.permit(:location, hotel: {})).and_call_original
      # get '/api/v1/hotels'
    end

    it 'renders success JSON response with hotels data' do
      hotels = create_list(:hotel, 3)

      allow_any_instance_of(Hotels::Fetch).to receive(:call).and_return(hotels)

      get '/api/v1/hotels'
      parsed_response = JSON.parse(response.body)

      expect(parsed_response['success']).to be_truthy
      expect(parsed_response['data']['hotels'].count).to eq(3)
    end

    it 'renders success JSON response with filter by location' do
      create(:hotel)
      create(:hotel, location: 'Bengaluru')

      get('/api/v1/hotels', params:)
      parsed_response = JSON.parse(response.body)

      expect(parsed_response['success']).to be_truthy
      expect(parsed_response['data']['hotels'].count).to eq(1)
    end
  end
end
