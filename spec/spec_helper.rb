$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'brauchbar'
require 'rspec/core'
require 'rspec/expectations'
require 'rspec/mocks'

module Rspec
  module Core
    module Matchers
      def fail
        raise_error(::Rspec::Expectations::ExpectationNotMetError)
      end

      def fail_with(message)
        raise_error(::Rspec::Expectations::ExpectationNotMetError, message)
      end
    end
  end
end

Rspec.configure do |c|
end
