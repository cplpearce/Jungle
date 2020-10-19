class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true, length: { minimum: 8 }
  validates :password, presence: true, length: { minimum: 8 }
  validate :password_and_confirmation_same

  def self.authenticate_with_credentials(email, password)
    user = where('LOWER(email) = ?', email.downcase.delete(' '))[0]
    user && user.authenticate(password)
  end

  def password_and_confirmation_same
    if self.password != self.password_confirmation
      errors.add(:password, "Password confirmation must match password")
    end
  end
end
