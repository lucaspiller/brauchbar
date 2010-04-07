require 'spec_helper'

describe Brauchbar::Request do
  describe '#execute' do

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

  end
end
