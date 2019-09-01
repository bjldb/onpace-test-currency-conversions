module ConversionsHelper

  PRECISION = 3.freeze

  def get_rate_text(rate)
    rate > 0 ? rate.round(PRECISION) : 'No data for this conversion pair'
  end

  def format_fetch_time(fetch_time)
    I18n.l(fetch_time.in_time_zone('Australia/Sydney'), format: :long)
  end
end
