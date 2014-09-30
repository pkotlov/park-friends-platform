class Pspace < ActiveRecord::Base

    validates :latitude, numericality: true
    validates :longitude, numericality: true

    validates :availability, inclusion: { in: %w(NO FEW MANY), allow_nil: true,
    message: "%{value} is not a valid availablity. following values are allowed [NO FEW MANY]" }
    
    def actuality
      if(self.created_at > DateTime.now - 5.minutes)
        "current"
      elsif(self.created_at > DateTime.now - 15.minutes)
        "recent"
      else
        "old"
      end
    end
end