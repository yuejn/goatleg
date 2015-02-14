class Profile < ActiveRecord::Base

  belongs_to :user

  validate :form_filled_out

  def form_filled_out
#    byebug
    if !avatar.present?
      errors.add(:avatar, "Upload an avatar, yo!")
    elsif !gender.present?
      errors.add(:gender, "What's yo gender!")
    elsif !seeking_gender.present?
      errors.add(:seeking_gender, "Who ya seeking?!")
    elsif !age.present?
      errors.add(:age, "What's yo age?!")
    elsif !about.present?
      errors.add(:about, "Give us some deets about you!")
    end
  end

end
