require 'net/http'
require 'net/https'
require 'json'
require 'uri'

module Softers

  class Client
    def initialize(username, password)
      @username, @password = username, password

      @headers = {'Content-Type' => 'application/x-www-form-urlencoded'}

      @http = Net::HTTP.new('www.softers.net', 443)
      @http.use_ssl = true
    end

    attr_accessor :username, :password, :http, :headers

    def send_message(data)
      response = @http.post('/messaging/smsclient.php', encode(data), headers)
      response.code.to_s == "200"
    end

    def encode(data)
      URI.encode_www_form data.merge(:type => 'send',:username => @username, :password => @password)
    end

  end
end
