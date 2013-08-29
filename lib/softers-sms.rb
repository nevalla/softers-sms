require 'net/http'
require 'net/https' if RUBY_VERSION == '1.8.7'
require 'json'
require 'uri'

module SoftersSms

  class Client
    def initialize(username, password)
      @username, @password = username, password

      @headers = {'Content-Type' => 'application/x-www-form-urlencoded'}

      @http = Net::HTTP.new('www.softers.net', Net::HTTP.https_default_port)
      @http.use_ssl = true
    end

    attr_accessor :username, :password, :http, :headers

    def send_message(data)
      response = @http.post('/messaging/smsclient.php', encode(data), headers)
      if response.code.to_s == "200"
        Success.new(true)
      else
        Failure.new(Error.new("#{response.body} (status=#{response.code.to_s})"))
      end

    end

    def encode(data)
      URI.encode_www_form data.merge(:type => 'send',:username => @username, :password => @password)
    end

  end

  class Success < Struct.new(:success)
    def success?
      true
    end

    def failure?
      false
    end
  end

  class Failure < Struct.new(:error)
    def success?
      false
    end

    def failure?
      true
    end
  end

  class Error < StandardError
  end
end
