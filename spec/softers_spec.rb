require 'minitest/autorun'
require 'mocha/setup'

require_relative '../lib/softers'

describe Softers::Client do
  before do
    @client = Softers::Client.new('key', 'secret')
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

    it 'should make the correct http call return a successful response if the first message status equals 200' do

      # Stub out post request
      http_response = stub(:code => "200", :body => 'Some content')


      data = 'to_phone=number&message=Hey%21&type=send&username=key&password=secret'

      @client.http.expects(:post).with('/messaging/smsclient.php', data, @headers).returns(http_response)

      response = @client.send_message({to_phone: 'number', message: 'Hey!'})

      response.must_equal(true)
    end

    it 'should return failure response if status code does not equal 200' do

      # Stub out post request
      http_response = stub(:code => "404", :body => 'Not found')

      data = 'to_phone=number&message=Hey%21&type=send&username=key&password=secret'

      @client.http.expects(:post).with('/messaging/smsclient.php', data, @headers).returns(http_response)

      response = @client.send_message({to_phone: 'number', message: 'Hey!'})

      response.must_equal(false)
    end
  end
end