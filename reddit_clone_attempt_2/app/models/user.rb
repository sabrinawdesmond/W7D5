# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true 
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true

  before_validate

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    user && is_password?(password) ? user : nil
  end

  def is_password?(password)
    bcrypt_obj = BCrypt::Password.new(self.password_digest)
    bcrypt_obj.is_password?(password)
  end

  def generate_unique_session_token
    token = SecureRandom::urlsafe_base64
    while User.exists?(session_token: token)
      token = SecureRandom::urlsafe_base64
    end
    token
  end

  def password=(password)
    @password = Password

    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= generate_unique_session_token
  end

  def reset_session_token
    self.session_token = generate_unique_session_token
    self.save!
    self.session_token
  end
end
