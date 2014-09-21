class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  
  
  def facebook_id_to_password
    if self.facebook_id.blank? == false && self.password.blank? #== "" or self.facebook_id == nil
      self.create_password
      #value = ""; 8.times{value  << (65 + rand(25)).chr}
    end
  end
  
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def create_password
    self.password = User.encrypt(User.new_remember_token)
  end
end
