require 'rails_helper'

describe 'Videos API' do
  before(:each) do
    create_list(:video, 2)
  end

  context 'GET /Videos' do
    it 'returns all videos' do
      get '/api/v1/videos', {}, { 'Accept' => 'application/json' }

      results = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(results['videos'].count).to eq 2
    end
  end

  context 'GET /videos/:id' do
    it 'returns one video' do
      video = Video.first

      get "/api/v1/videos/#{video.id}", {}, { 'Accept' => 'application/json' }

      results = JSON.parse(response.body)

      expect(results['video']['title']).to eq video.title
      expect(results['video']['image']).to eq video.image
      expect(results['video']['slug']).to eq video.slug
      expect(results['video']['description']).to eq video.description
      expect(results['video']['host']).to eq video.host
      expect(results['video']['embed_code']).to eq video.embed_code
    end
  end
end
