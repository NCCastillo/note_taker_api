require 'rails_helper'
require './lib/confreaks'

describe Confreaks::Client do
  def fetch_from_api(file_name)
    stub_request(:get, base_url + file_name).to_return(body: File.new('spec/fixtures/' + file_name, 'rb').read, status: 200)
  end

  let(:base_url) { 'http://confreaks.tv/api/v1/'}

  context '#conferences' do
    it 'returns all conferences' do
      fetch_from_api('conferences.json')
      confreaks = Confreaks::Client.new

      expect(confreaks).to be_an_instance_of Confreaks::Client
      expect(confreaks.conferences.count).to eq 120
    end
  end

  context '#conference_by_name' do
    it 'returns a conference by name' do
      fetch_from_api('conferences/ruby-conference.json')
      confreaks = Confreaks::Client.new
      confreaks.conference_by_name('ruby_conference')

      expect(confreaks.conference['name']).to eq 'Ruby Conference'
    end
  end

  context '#events' do
    it 'returns the event count' do
      skip
      fetch_from_api('event_count.json')
      confreaks = Confreaks::Client.event_count

      expect(confreaks.event_count["event_count"]).to eq 243
    end

    it 'returns all events' do
      skip
      fetch_from_api('events.json')
      confreaks = Confreaks::Client.events

      expect(confreaks.events.count).to eq 243
    end
  end
end
