require 'json'
require 'net/http' #to make a GET request
# require 'open-uri' #to fetch the data from the URL to then be parsed by JSON
class MainController < ApplicationController
  def get_api
      url = URI.parse("http://nflarrest.com/api/v1/player")
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }

      #to be able to access https URL, these line should be added
      #github api has an https URL
      # http.use_ssl = true
      # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      # request = Net::HTTP::Get.new(uri.request_uri)
      # response = http.request(request)
      #store the body of the requested URI (Uniform Resource Identifier)
      data = JSON.load(res.body)
      #to parse JSON string; you may also use JSON.parse()
      #JSON.load() turns the data into a hash
     # @player = JSON.load(data)
      # render :text => data.class
      render :json => data[0..50]
  end
end
