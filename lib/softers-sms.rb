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
      data[:message] = data[:message].encode('ISO-8859-1')
      response = @http.post('/messaging/smsclient.php?type=send', encode(data), headers)
      if response.body.strip == "200 OK"
        Success.new(true)
      else
        Failure.new(Error.new("#{response.body}"))
      end

    end

    def encode(data)
      URI.encode_www_form data.merge(:username => @username, :password => @password)
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
