require 'rails_helper'

describe 'User Notes API' do
  context 'GET /users/:id/notes' do
    let(:provider) { Doorkeeper::Application.create!(name: "Test App", redirect_uri: "https://testapp.com") }
    let(:user)  { create(:user) }
    let(:token)  { Doorkeeper::AccessToken.create!(application_id: provider.id, resource_owner_id: user.id) }

    it 'returns 401 when not authorized' do
      get "/api/v1/users/#{user.id}/notes", {}, { 'Accept' => 'application/json' }

      expect(response.status).to eq 401
    end

    it 'returns 401 when not authorized with an invalid token' do
      get "/api/v1/users/#{user.id}/notes", { access_token: "bleh12" }, { 'Accept' => 'application/json' }

      expect(response.status).to eq 401
    end

    it 'returns 200 with a valid token' do
      get "/api/v1/users/#{user.id}/notes", { access_token: token.token }, { 'Accept' => 'application/json' }

      expect(response.status).to eq 200
    end
  end
end
