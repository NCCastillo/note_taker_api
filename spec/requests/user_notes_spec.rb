require 'rails_helper'

describe 'User Notes API' do
  let(:provider) { Doorkeeper::Application.create!(name: "Test App", redirect_uri: "https://testapp.com") }
  let(:user)  { create(:user) }
  let(:token)  { Doorkeeper::AccessToken.create!(application_id: provider.id, resource_owner_id: user.id) }

  context 'GET /users/notes' do
    it 'returns 401 when not authorized' do
      get "/api/v1/users/notes", {}, { 'Accept' => 'application/json' }

      expect(response.status).to eq 401
    end

    it 'returns 401 when not authorized with an invalid token' do
      get "/api/v1/users/notes", { access_token: "bleh12" }, { 'Accept' => 'application/json' }

      expect(response.status).to eq 401
    end

    it 'returns 200 with a valid token' do
      get "/api/v1/users/notes", { access_token: token.token }, { 'Accept' => 'application/json' }

      expect(response.status).to eq 200
    end

    it 'returns all users notes' do
      notes = [create(:note, body: "note one"), create(:note, body: "note two")]
      user.notes << notes

      get "/api/v1/users/notes", { access_token: token.token }, { 'Accept' => 'application/json' }

      results = JSON.parse(response.body)

      expect(results['notes'].count).to eq 2
    end
  end

  context 'GET /users/notes/:id' do
    it "returns one user's note" do
      notes = [create(:note, body: "note one"), create(:note, body: "note two")]
      note = notes.first
      user.notes << notes

      get "/api/v1/users/notes/#{note.id}", { access_token: token.token }, { 'Accept' => 'application/json' }

      results = JSON.parse(response.body)

      expect(results['note']['id']).to eq note.id
      expect(results['note']['body']).to eq note.body
      expect(results['note']['note_taken_at'].to_date).to eq note.note_taken_at.to_date
    end
  end
end
