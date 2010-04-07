class Brauchbar::Request
  def self.execute(params = {})
    raise ArgumentError.new('Method option required') if params[:method].nil?
    raise ArgumentError.new('Unsupported Method') unless %w{ get }.include?(params[:method].to_s)

    raise ArgumentError.new('URI option required') if params[:uri].nil?
    begin
      URI.parse(params[:uri])
    rescue URI::InvalidURIError => e
      raise ArgumentError.new('Invalid URI')
    end
  end
end
