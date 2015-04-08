require 'rails_helper'
require './lib/confreaks'

describe Confreaks::Client do
  it 'fetches all conferences' do
    stub_request(:get, 'http://confreaks.tv/api/v1/conferences.json').
    to_return(body: File.new('spec/fixtures/conferences.json', 'rb').read, status: 200)

    results = Confreaks::Client.get(route: :conferences)

    expect(results.count).to eq 120
  end

  it 'fetches one conference' do
    stub_request(:get, 'http://confreaks.tv/api/v1/conferences/ruby-conference.json').
    to_return(body: File.new('spec/fixtures/ruby-conference.json', 'rb').read, status: 200)

    results = Confreaks::Client.get(route: :conferences, attribute: "ruby_conference")

    expect(results["name"]).to eq "Ruby Conference"
  end
end
