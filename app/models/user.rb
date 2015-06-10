class User < ActiveRecord::Base
  has_secure_password
  has_many :entries, dependent: :destroy
  accepts_nested_attributes_for :entries, reject_if: lambda {|attributes| attributes[:content].blank?}
  
  validates :email, presence: true, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
  before_save { self.email = email.downcase }
  validates :password, length: { minimum: 7 }
  validates :password_confirmation, presence: true

end
