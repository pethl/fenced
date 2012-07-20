# == Schema Information
#
# Table name: users
#
#  id          :integer         not null, primary key
#  fullname    :string(255)
#  email       :string(255)
#  twittername :string(255)
#  yob         :string(255)
#  password_digest         :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :fullname, :email, :password, :password_confirmation, :twittername, :yob
  has_secure_password

  before_save { |user| user.email = email.downcase }
    before_save :create_remember_token

  validates :fullname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end

end