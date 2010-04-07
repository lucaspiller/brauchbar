require 'spec_helper'

describe Brauchbar::Response do
  before(:each) do
    @body = "{'name': 'bob', 'colour': 'blue'}"
    @headers = {
      'Content-Length' => @body.length,
      'Content-Type' => 'text/json',
      'Expires' => 'Sat, 01 Jan 2000 00:00:00 GMT',
      'Date' => 'Wed, 07 Apr 2010 20:31:36 GMT'
    }

    @mock_response = mock('PatronResponse')
    @mock_response.stub!(:status).and_return(200)
    @mock_response.stub!(:body).and_return(@body)
    @mock_response.stub!(:headers).and_return(@headers)

    @res = Brauchbar::Response.new(@mock_response)
  end

  describe 'creation' do
    it 'should set the status' do
      @res.raw_status.should == 200
    end

    it 'should set the body' do
      @res.raw_body.should == @body
    end

    it 'should set the status' do
      @res.raw_headers.should == @headers
    end
  end

  it 'should return the body as to_s' do
    @res.to_s.should == @body
  end

  it 'should return the body when referenced by itself' do
    @res.should == @body
  end
end
