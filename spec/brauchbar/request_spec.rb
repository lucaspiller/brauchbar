require 'spec_helper'

describe Brauchbar::Request do
  describe '#execute' do
    before(:each) do
      @brauchbar_response = mock('BrauchbarResponse')
      Brauchbar::Response.stub!(:new).and_return(@brauchbar_response)
      @response = mock('PatronResponse')
      @session = mock('PatronSession')
      @session.stub!(:request).and_return(@response)
      Patron::Session.stub!(:new).and_return(@session)
    end

    describe 'option validation' do
      it 'should raise if not passed a uri' do
        lambda {
          Brauchbar::Request.execute(:method => :get)
        }.should raise_error(ArgumentError)
      end

      it 'should raise if not passed a method' do
        lambda {
          Brauchbar::Request.execute(:uri => 'http://www.google.com/')
        }.should raise_error(ArgumentError)
      end

      it 'should raise if the uri is invalid' do
        lambda {
          Brauchbar::Request.execute(:method => :get, :uri => 'not??really/\a==uri/\1234')
        }.should raise_error(ArgumentError)
      end

      it 'should raise if the method is invalid' do
        lambda {
          Brauchbar::Request.execute(:method => :stop, :uri => 'http://www.google.com/')
        }.should raise_error(ArgumentError)
      end

      it 'should be happy otherwise' do
        lambda {
          Brauchbar::Request.execute(:method => :get, :uri => 'http://www.google.com/')
        }.should_not raise_error(ArgumentError)
      end
    end

    describe 'making requests' do
      it 'should create a Patron session' do
        Patron::Session.should_receive(:new)
        Brauchbar::Request.execute(:method => :get, :uri => 'http://www.google.com/')
      end

      it 'should set headers if passed' do
        @session.should_receive(:request).with(:get, 'http://www.google.com/', { 'User-Agent' => 'brauchbar get test' })
        Brauchbar::Request.execute(:method => :get, :uri => 'http://www.google.com/', :headers => { 'User-Agent' => 'brauchbar get test' })
      end

      it 'should make the request' do
        @session.should_receive(:request).with(:get, 'http://www.google.com/', {})
        Brauchbar::Request.execute(:method => :get, :uri => 'http://www.google.com/')
      end

      it 'should create a response object from the Patron response' do
        # rspec doesn't seem to like stub and should receive together,
        # called rspec_reset to clear the stub solves it
        Brauchbar::Response.rspec_reset
        Brauchbar::Response.should_receive(:new).with(@response)
        Brauchbar::Request.execute(:method => :get, :uri => 'http://www.google.com/')
      end

      it 'should return a brauchbar response object' do
        Brauchbar::Request.execute(:method => :get, :uri => 'http://www.google.com/').should == @brauchbar_response
      end
    end

  end
end
