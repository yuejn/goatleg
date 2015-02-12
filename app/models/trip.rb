class Trip < ActiveRecord::Base
  
  validates :destination, :start_date, :end_date, presence: true 

  def destination_name
    country = ISO3166::Country[destination]
    country.translations[I18n.locale.to_s] || country.name
  end

  validate :form_filled_out

  def form_filled_out
#    byebug
    if !destination.present?
      errors.add(:destination, "Fill out a destination, yo!")
    elseif !start_date.present?
      errors.add(:start_date, "Fill in a start date!")
    elseif !end_date.present?
      errors.add(:end_date, "Fill in a end date!")
    end
  end

end
