class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
  validates :email, uniqueness:{ case_sensitive: false }
  validates :password_digest, length:{minimum:10}
  def authenticate_with_credentials(email,password)
    if email && password
      self
    else
      nil
    end
  end
end
