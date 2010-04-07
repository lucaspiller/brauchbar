require 'uri'

require 'rubygems'
require 'patron'

class Brauchbar
  autoload :Request, 'brauchbar/request'
  autoload :Response, 'brauchbar/response'

  def self.get(uri, params = {})
    options = {
      :method => :get,
      :uri => uri
    }.merge(params)

    Request.execute options
  end
end
