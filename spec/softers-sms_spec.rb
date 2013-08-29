require 'minitest/autorun'
require 'mocha/setup'

require_relative '../lib/softers-sms'

describe SoftersSms::Client do
  before do
    @client = SoftersSms::Client.new('key', 'secret')
  end

  describe 'http method' do
    it 'should return a Net::HTTP object that uses SSL' do
      @client.http.must_be_instance_of(Net::HTTP)
      @client.http.use_ssl?.must_equal(true)
    end
  end

  describe 'headers method' do
    it 'should return a hash' do
      @client.headers.must_be_kind_of(Hash)
    end
  end

  describe 'send_message method' do
    before do
      @headers = {'Content-Type' => 'application/x-www-form-urlencoded'}
    end

    it 'should make the correct http call return a successful response body equals 200 OK' do

      # Stub out post request
      http_response = stub(:code => "200", :body => '200 OK')


      data = 'to_phone=number&message=Hey%21&username=key&password=secret'

      @client.http.expects(:post).with('/messaging/smsclient.php?type=send', data, @headers).returns(http_response)

      response = @client.send_message({to_phone: 'number', message: 'Hey!'})

      response.success?.must_equal(true)
    end

    it 'should return failure response if response body does not equal 200 OK' do

      # Stub out post request
      http_response = stub(:code => "200", :body => '404 Not found\r\nUnable to find user information')

      data = 'to_phone=number&message=Hey%21&username=key&password=secret'

      @client.http.expects(:post).with('/messaging/smsclient.php?type=send', data, @headers).returns(http_response)

      response = @client.send_message({to_phone: 'number', message: 'Hey!'})

      response.success?.must_equal(false)
      response.failure?.must_equal(true)
      response.error.to_s.must_equal('404 Not found\r\nUnable to find user information')

    end
  end
end