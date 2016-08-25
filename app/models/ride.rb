class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  

    def take_ride
       user = self.user
       ride = self.attraction

       if user.height < ride.min_height && user.tickets < ride.tickets
         flash[:message] = "Ya too small, and ain't got enough money."
         redirect_to attractions_path
       elsif user.height < ride.min_height
         flash[:message] = "Ya too damn small."
         redirect_to attractions_path
       elsif user.tickets < ride.tickets
         flash[:message] = "You broke"
         redirect_to attractions_path
       else
         user.tickets -= ride.tickets
         user.happiness += ride.happiness_rating
         user.nausea += ride.nausea_rating
         user.save
         flash[:message] = "Thanks for riding the #{ride.name}!"
         redirect_to user_path(user)
       end
     end



end
