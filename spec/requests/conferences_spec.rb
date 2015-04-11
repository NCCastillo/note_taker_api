require 'rails_helper'

describe 'Conferences API' do

  before(:each) do
    @conference_one =  create(:conference, name: 'Ruby Conference')
    create(:conference, name: 'Ember Conference')
  end

  context 'GET /conferences' do
    it 'returns all conferences' do
      get '/api/v1/conferences', {}, { 'Accept' => 'application/json' }

      results = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(results['conferences'].count).to eq 2
    end
  end

  context 'GET /conferences/:id' do
    it 'returns a conference' do
      get "/api/v1/conferences/#{@conference_one.id}", {}, { 'Accept' => 'application/json' }

      results = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(results['conference']['id']).to eq @conference_one.id
      expect(results['conference']['name']).to eq @conference_one.name
    end
  end
end
