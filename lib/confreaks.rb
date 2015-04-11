require 'httparty'
require 'json'

module Confreaks
  class Client
    BASE_URL = 'http://confreaks.tv/api/v1/'

    attr_reader :conference, :event, :event_videos

    def initialize
    end

    def conferences
      @conferences ||= fetch_from_api("conferences.json")
    end

    def conference_by_name(name)
      @conference ||= fetch_from_api("conferences/#{name.dasherize}.json")
    end

    def events
      @events ||= fetch_from_api('events.json')
    end

    def event_by_short_code(short_code)
      @event ||= fetch_from_api("events/#{short_code}.json")
    end

    def videos_by_short_code(short_code)
      @event_videos ||= fetch_from_api("events/#{short_code}/videos.json")
    end

    def videos
      @videos ||= fetch_from_api("videos.json")
    end

    def videos_by_slug(slug)
      @videos_slug ||= fetch_from_api("videos/#{slug}.json")
    end

    private

    def fetch_from_api(api_end_point)
      response = HTTParty.get(BASE_URL + api_end_point)
      JSON.parse(response.body)
    end
  end
end
