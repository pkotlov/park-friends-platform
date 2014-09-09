class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  
  
  def facebook_id_to_password
    if blank self.facebook_id #== "" or self.facebook_id == nil
      
    else
      self.facebook_id = "ABASDFGGH"
      #value = ""; 8.times{value  << (65 + rand(25)).chr}
    end
  end
end
