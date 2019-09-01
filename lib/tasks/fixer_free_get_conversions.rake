namespace :fixer_free do
  desc "Get latest exchange rate for saved conversion pairs (free version of fixer)"
  task :get_conversions => :environment do
    begin 
      target_currencies = Conversion.target_currencies.join(',')
      result = FixerFreeService.get_latest_conversions(target_currencies)
      isSuccessfulFetch = result['success']
      if isSuccessfulFetch
        ratesHash = result['rates']
        timestamp = result['timestamp']
        Conversion.all.each do |conversion|
          rateFrom = result['rates'][conversion.convert_from]
          rateTo = result['rates'][conversion.convert_to]
          conversion.updateRateValue(rateFrom, rateTo, timestamp)
        end
      else
        # TODO: convert to logger
        error_type = result['error']['type']
        error_info = result['error']['info'] || 'no further info'
        puts "Error fetching data: #{result['error']['type']}, #{error_info}"
      end
    rescue => error
      # TODO: convert to logger
      puts error
    end
  end
end