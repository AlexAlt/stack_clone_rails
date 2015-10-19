require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, presence: :true
  validates :password_digest, :confirmation => true

  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
