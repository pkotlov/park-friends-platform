class Pspace < ActiveRecord::Base

    validates :latitude, numericality: true
    validates :longitude, numericality: true

    validates :availability, inclusion: { in: %w(NO FEW MANY),
    message: "%{value} is not a valid availablity. following values are allowed [NO FEW MANY]" }
    
    scope :availability_positive, where.not(availability: 'NO')
    
    def self.get_only_current_pspaces(test)
      if test == "true"
        all
      else
        where("created_at > ?", DateTime.now - 30.minutes)
      end
    end
    
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