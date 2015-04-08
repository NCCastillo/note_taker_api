require 'httparty'
require 'json'

module Confreaks
  class Client
    def self.get(api_options)
      if api_options[:attribute].blank?
        response = HTTParty.get("http://confreaks.tv/api/v1/#{api_options[:route]}.json")
      else
        response = HTTParty.get("http://confreaks.tv/api/v1/#{api_options[:route]}/#{api_options[:attribute].dasherize}.json")
      end
      JSON.parse(response.body)
    end
  end
end
