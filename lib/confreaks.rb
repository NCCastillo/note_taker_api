require 'httparty'
require 'json'

module Confreaks
  class Client
    attr_reader :conference, :conferences, :event_count, :events

    def initialize(results)
      @conferences = results[:conferences]
      @conference = results[:conference]
      @event_count = results[:event_count]
      @events = results[:events]
    end

    def self.conferences(options={})
      if options[:name]
        response = HTTParty.get("http://confreaks.tv/api/v1/conferences/#{options[:name].dasherize}.json")
        results = JSON.parse(response.body)
        attributes = { conference: results }
      else
        response = HTTParty.get('http://confreaks.tv/api/v1/conferences.json')
        results = JSON.parse(response.body)
        attributes = { conferences: results }
      end
      new(attributes)
    end

    def self.event_count
      response = HTTParty.get('http://confreaks.tv/api/v1/event_count.json')
      attributes = { event_count: JSON.parse(response.body) }
      new(attributes)
    end

    def self.events
      response = HTTParty.get('http://confreaks.tv/api/v1/events.json')
      attributes = { events: JSON.parse(response.body) }
      new(attributes)
    end
  end
end
