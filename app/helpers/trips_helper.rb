module TripsHelper

  def gender id
    if Profile.find(id).gender == "m"
      "male"
    else
      "female"
    end
  end

  def seeking_gender id
    if Profile.find(id).seeking_gender == "m"
      "male"
    else
      "female"
    end
  end

end
