require 'rails_helper'

describe 'Events API' do

  before(:each) do
    @event = create(:event, name: 'Some conference 2015', conference: 'Some Conference', short_code: 'some2015')
    create(:event, name: 'Another conference 2015', conference: 'Another Conference', short_code: 'another2015')
  end

  context 'GET /events' do
    it 'returns all events' do
      get '/api/v1/events', {}, { 'Accept' => 'application/json' }

      results = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(results['events'].count).to eq 2
    end
  end

  context 'GET /events/:id' do
    it 'returns an event' do
      get "/api/v1/events/#{@event.id}", {}, { 'Accept' => 'application/json' }

      results = JSON.parse(response.body)

      expect(results['event']['id']).to eq @event.id
      expect(results['event']['name']).to eq @event.name
      expect(results['event']['conference']).to eq @event.conference
      expect(results['event']['short_code']).to eq @event.short_code
    end
  end
end
