require 'rails_helper'

feature 'OAuth authorization' do

  let(:application) { Doorkeeper::Application.create!(name: "Test App", redirect_uri: "https://testapp.com") }
  let(:user) { create(:user) }
  let(:token) { Doorkeeper::AccessToken.create!(application_id: application.id, resource_owner_id: user.id) }
  let(:client_app) do
      OAuth2::Client.new(application.uid, application.secret) do |client|
      client.request :url_encoded
      client.adapter :rack, Rails.application
    end
  end

  scenario 'authorizes client' do
    client_token = client_app.password.get_token(user.email, user.password)

    expect(client_token).to_not be_expired
  end

  scenario 'does not authorize client' do
    expect { client_app.password.get_token(user.email, '123456789') }.to raise_error(OAuth2::Error)
  end
end
