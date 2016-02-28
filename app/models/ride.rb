class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    warning = "Sorry. "
    if user.tickets < attraction.tickets
      warning += "You do not have enough tickets the #{attraction.name}. "
    end
    if user.height < attraction.min_height
      warning += "You are not tall enough to ride the #{attraction.name}. "
    end

    if warning != "Sorry. "
      return warning
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      return "Thanks for riding the #{attraction.name}!"
    end
  end
end
