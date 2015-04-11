require 'rails_helper'

describe 'Conferences API' do

  let(:conference_one) { create(:conference, name: 'Ruby Conference') }
  let(:conference_two) { create(:conference, name: 'Ember Conference') }

  context 'GET /conferences' do
    it 'returns all conferences' do
      expected_results = [{"id"=>conference_one.id, "name"=>conference_one.name}, {"id"=>conference_two.id, "name"=>conference_two.name}]

      get '/api/v1/conferences', {}, { 'Accept' => 'application/json' }

      results = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(results['conferences']).to eq expected_results
    end
  end

  context 'GET /conferences/:id' do
    it 'returns a conference' do
      expected_results = { "id"=>conference_one.id, "name"=>conference_one.name }

      get "/api/v1/conferences/#{conference_one.id}", {}, { 'Accept' => 'application/json' }

      results = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(results['conference']).to eq expected_results
    end
  end
end