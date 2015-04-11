require 'rails_helper'

describe 'Presenters API' do

  before(:each) do
    @presenter = create(:presenter, first_name: 'John', last_name: 'Candy')
    create(:presenter, first_name: 'Emily', last_name: 'Smith')
  end

  context 'GET /presenters' do
    it 'returns all presenters' do
      get '/api/v1/presenters', {}, { 'Accept' => 'application/json' }

      results = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(results['presenters'].count).to eq 2
    end
  end

  context 'GET /presenters' do
    it 'returns one presenter' do
      get "/api/v1/presenters/#{@presenter.id}", {}, { 'Accept' => 'application/json' }

      results = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(results['presenter']['id']).to eq @presenter.id
      expect(results['presenter']['first_name']).to eq @presenter.first_name
      expect(results['presenter']['last_name']).to eq @presenter.last_name
      expect(results['presenter']['slug']).to eq @presenter.slug
      expect(results['presenter']['twitter']).to eq @presenter.twitter
    end
  end
end
