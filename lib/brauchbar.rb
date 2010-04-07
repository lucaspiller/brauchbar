class Brauchbar
  autoload :Request, 'brauchbar/request'

  def self.get(uri, params = {})
    options = {
      :method => :get,
      :uri => uri
    }.merge(params)

    Request.execute options
  end
end
