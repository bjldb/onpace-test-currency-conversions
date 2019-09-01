class Conversion < ApplicationRecord
  validates :convert_from, :convert_to, presence: true, length: { is: 3 }, allow_blank: false
  before_save :uppercase_currency

  TIMEZONE = 'Australia/Sydney'.freeze

  def uppercase_currency
    convert_from.upcase!
    convert_to.upcase!
  end
  
  def self.target_currencies
    self.distinct.pluck(:convert_to) | self.distinct.pluck(:convert_from)
  end

  def updateRateValue(curFromEurRate, curToEurRate, timestamp)
    if curFromEurRate.present? && curToEurRate.present?
      curFromEurVal = 1.0 / curFromEurRate
      newRate = curFromEurVal * curToEurRate
      update_attribute(:rate, newRate)
    end 
    update_attribute(:fetch_time, Time.at(timestamp).in_time_zone(TIMEZONE))
  end
end
