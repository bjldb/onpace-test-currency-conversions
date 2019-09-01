class FixerFreeService
  def self.get_latest_conversions(symbols_string)
    access_key = ENV['KEY']
    response = RestClient.get "http://data.fixer.io/api/latest?access_key=#{access_key}&symbols=#{symbols_string}"
    JSON.parse(response)
  end
end