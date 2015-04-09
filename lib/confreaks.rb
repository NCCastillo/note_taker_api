require 'httparty'
require 'json'

module Confreaks
  class Client
    BASE_URL = 'http://confreaks.tv/api/v1/'
    attr_reader :conference, :conferences, :event_count, :events

    def initialize(results)
      @conferences = results[:conferences]
      @conference = results[:conference]
      @event_count = results[:event_count]
      @events = results[:events]
    end

    def self.conferences(options={})
      if options[:name]
        results = self.fetch_from_api("conferences/#{options[:name].dasherize}.json")
        attributes = { conference: results }
      else
        results = self.fetch_from_api('conferences.json')
        attributes = { conferences: results }
      end
      new(attributes)
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

    def self.fetch_from_api(api_end_point)
      response = HTTParty.get(BASE_URL + api_end_point)
      JSON.parse(response.body)
    end
  end
end
