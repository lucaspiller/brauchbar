class Brauchbar::Request
  def self.execute(params = {})
    # validation
    raise ArgumentError.new('Method option required') if params[:method].nil?
    raise ArgumentError.new('Unsupported Method') unless %w{ get }.include?(params[:method].to_s)

    raise ArgumentError.new('URI option required') if params[:uri].nil?
    begin
      URI.parse(params[:uri])
    rescue URI::InvalidURIError => e
      raise ArgumentError.new('Invalid URI')
    end

    # clear headers
    params[:headers] ||= {}

    # create request
    session = Patron::Session.new

    # make request
    response = session.request(params[:method], params[:uri], params[:headers])

    # create brauchbar response object
    Brauchbar::Response.new response
  end
end
