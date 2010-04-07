require 'spec_helper'

describe Brauchbar, 'api' do
  describe 'get requests' do
    it 'should work' do
      Brauchbar::Request.should_receive(:execute).with(:method => :get, :uri => 'http://www.google.com/')
      Brauchbar.get 'http://www.google.com/'
    end

    it 'should work with headers' do
      Brauchbar::Request.should_receive(:execute).with(:method => :get, :uri => 'http://www.google.com/', :headers => { 'User-Agent' => 'brauchbar get test' })
      Brauchbar.get('http://www.google.com/', :headers => { 'User-Agent' => 'brauchbar get test' })
    end
  end
end
