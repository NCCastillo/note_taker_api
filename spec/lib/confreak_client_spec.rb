require 'rails_helper'
require './lib/confreaks'

describe Confreaks::Client do
  def fetch_from_api(file_name)
    stub_request(:get, base_url + file_name).to_return(body: File.new('spec/fixtures/' + file_name, 'rb').read, status: 200)
  end

  let(:base_url) { 'http://confreaks.tv/api/v1/'}
  let(:confreaks) { Confreaks::Client.new }

  context '#conferences' do
    it 'returns all conferences' do
      fetch_from_api('conferences.json')

      expect(confreaks).to be_an_instance_of Confreaks::Client
      expect(confreaks.conferences.count).to eq 120
    end
  end

  context '#conference_by_name' do
    it 'returns a conference by name' do
      fetch_from_api('conferences/ruby-conference.json')
      result = confreaks.conference_by_name('ruby_conference')

      expect(result['name']).to eq 'Ruby Conference'
      expect(confreaks.conference).to eq result
    end
  end

  context '#events' do
    it 'returns all events' do
      fetch_from_api('events.json')
      results = confreaks.events

      expect(results.count).to eq 243
      expect(confreaks.events).to eq results
    end
  end

  context '#event_by_short_code' do
    it 'returns an event' do
      fetch_from_api('events/RubyConf2014.json')
      result = confreaks.event_by_short_code("RubyConf2014")

      expect(result["short_code"]).to eq "RubyConf2014"
      expect(confreaks.event).to eq result
    end
  end

  context '#videos_by_short_code' do
    it 'returns all videos for an event' do
      fetch_from_api('events/RubyConf2014/videos.json')
      results = confreaks.videos_by_short_code("RubyConf2014")

      expect(results.count).to eq 65
      expect(confreaks.event_videos).to eq results
    end
  end

  context '#videos' do
    it 'returns all videos' do
      fetch_from_api('videos.json')
      results = confreaks.videos

      expect(results.count).to eq 12
    end
  end

  context '#videos_by_slug' do
    it 'returns a video by slug' do
      fetch_from_api('videos/mwjs2014-error-handling-in-node-js.json')
      result = confreaks.videos_by_slug('mwjs2014-error-handling-in-node-js')

      expect(result['slug']).to eq 'mwjs2014-error-handling-in-node-js'
    end

  end
end
