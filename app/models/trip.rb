class Trip < ActiveRecord::Base
  
  validates :destination, :start_date, :end_date, presence: true 

  def destination_name
    country = ISO3166::Country[destination]
    country.translations[I18n.locale.to_s] || country.name
  end

end
