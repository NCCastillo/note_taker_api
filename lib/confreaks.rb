require 'httparty'
require 'json'

module Confreaks
  class Client
    BASE_URL = 'http://confreaks.tv/api/v1/'

    attr_reader :conference

    def initialize
    end

    def conferences
      @conferences ||= fetch_from_api("conferences.json")
    end

    def conference_by_name(name)
      @conference ||= fetch_from_api("conferences/#{name.dasherize}.json")
    end

    def self.event_count
      results = self.fetch_from_api('event_count.json')
      attributes = { event_count: results }
      new(attributes)
    end

    def self.events
      results = fetch_from_api('events.json')
      attributes = { events: results }
      new(attributes)
    end

    private

    def fetch_from_api(api_end_point)
      response = HTTParty.get(BASE_URL + api_end_point)
      JSON.parse(response.body)
    end
  end
end
