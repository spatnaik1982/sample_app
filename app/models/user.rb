class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :photo_url
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
#  validates :password, presence: true, length: { minimum: 6 }
#  validates :password_confirmation, presence: true

  def self.from_omniauth(auth)
    find_by_email(auth.info.email) || create_with_omniauth(auth)
  end
  def self.create_with_omniauth(auth)
    create! do |user1|
      user1.firstname = auth.info.first_name
      user1.lastname = auth.info.last_name
      user1.email = auth.info.email
      user1.photo_url = auth.info.image
      user1.password = "121123" 
      user1.password_confirmation = "121123"
  
      user1.save!
    end
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
