require 'rails_helper'
require './lib/confreaks'

describe Confreaks::Client do
  context "conferences" do
    it 'returns all conferences' do
      stub_request(:get, 'http://confreaks.tv/api/v1/conferences.json').
      to_return(body: File.new('spec/fixtures/conferences.json', 'rb').read, status: 200)

      confreaks = Confreaks::Client.conferences

      expect(confreaks).to be_an_instance_of Confreaks::Client
      expect(confreaks.conferences.count).to eq 120
    end

    it 'returns one conference by name' do
      stub_request(:get, 'http://confreaks.tv/api/v1/conferences/ruby-conference.json').
      to_return(body: File.new('spec/fixtures/ruby-conference.json', 'rb').read, status: 200)

      confreaks = Confreaks::Client.conferences(name: "ruby_conference")

      expect(confreaks.conference["name"]).to eq "Ruby Conference"
    end
  end

  context "events" do
    it 'returns the event count' do
      stub_request(:get, 'http://confreaks.tv/api/v1/event_count.json').
      to_return(body: File.new('spec/fixtures/event_count.json', 'rb').read, status: 200)

      confreaks = Confreaks::Client.event_count

      expect(confreaks.event_count["event_count"]).to eq 243
    end

    it 'returns all events' do
      stub_request(:get, 'http://confreaks.tv/api/v1/events.json').
      to_return(body: File.new('spec/fixtures/events.json', 'rb').read, status: 200)

      confreaks = Confreaks::Client.events

      expect(confreaks.events.count).to eq 243
    end
  end
end
