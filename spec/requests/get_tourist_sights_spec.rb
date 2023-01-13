require 'rails_helper'

RSpec.describe 'Get Tourist Sights' do
    it 'returns tourist sights as json' do
        country = "France"

        get "/api/v1/tourist_sights?country=#{country}"

        expect(response).to be_successful

        parsed_response = JSON.parse(response.body,symbolize_names: true)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response).to have_key(:data)
        expect(parsed_response[:data]).to be_an(Array)

        tourist_sight = parsed_response[:data][0]

        expect(tourist_sight).to have_key(:id)
        expect(tourist_sight).to have_key(:type)
        expect(tourist_sight).to have_key(:attributes)
        expect(tourist_sight[:attributes]).to have_key(:name)
        expect(tourist_sight[:attributes]).to have_key(:address)
        expect(tourist_sight[:attributes]).to have_key(:place_id)
    end
end