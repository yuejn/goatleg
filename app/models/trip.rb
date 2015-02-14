class Trip < ActiveRecord::Base

  scope :destination, -> (destination) { where destination: destination }
  scope :gender, -> (gender) { 
    joins('LEFT JOIN users ON trips.user_id = users.id 
      LEFT JOIN profiles ON profiles.user_id = users.id').where('profiles.gender = ?', gender)
  }

  validates :destination, :start_date, :end_date, presence: true 
  belongs_to :user

  # has_many :profile, through: :user

  # def self.gender gender
  #   ids = Trip.all.map(&:user_id)
  #   profile_ids = Profile.where(gender: gender, user_id: ids).map(&:user_id)
  #   Trip.where(user_id: profile_ids)
  # end

  def destination_name
    country = ISO3166::Country[destination]
    country.translations[I18n.locale.to_s] || country.name
  end

  validate :form_filled_out

  def form_filled_out
#    byebug
    if !destination.present?
      errors.add(:destination, "Fill out a destination, yo!")
    elsif !start_date.present?
      errors.add(:start_date, "Fill in a start date!")
    elsif !end_date.present?
      errors.add(:end_date, "Fill in a end date!")
    end
  end

end
