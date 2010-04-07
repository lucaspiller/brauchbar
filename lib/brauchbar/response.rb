class Brauchbar::Response < String
  attr_reader :raw_status, :raw_body, :raw_headers

  def initialize(response)
    @raw_status = response.status
    @raw_body = response.body
    @raw_headers = response.headers

    # no need to overwrite to_s :)
    super(body)
  end

  alias :status :raw_status
  alias :body :raw_body
  alias :headers :raw_headers
end
