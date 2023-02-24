def self.find_by_credentials(username, password)
  user = User.find_by(username: username)

  user && user.is_password?(password)? user : nil
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

validates 
attr_reader :password

def password=(password)
  @password = password
  password_digest = BCrypt::Password.create(password)
end

def ensure_session_token
  self.session_token ||= generate_unique_session_token
end

def reset_session_token
  self.session_token = generate_unique_session_token
  self.save!
  self.session_token  
end



def self.find_by_credentials(username, password)
  user = User.find_by(username: username)
  user && user.is_password?(password)? user : nil
end

def is_password?(password)
  bcrypt_obj = BCrypt::Password.new(password_digest)
  bcrypt_obj.is_password?(password)
end

def generate_unique_session_token
  token = SecureRandom::urlsafe_base64
  while User.exists?(session_token: token)
    token = SecureRandom::urlsafe_base64
  end
  token
end

validates
attr_reader :password

def password=(password)
  @password = password
  password_digest = BCrypt::Password.create(password)
end

def ensure_session_token
  self.session_token ||= generate_unique_session_token
end

def reset_session_token
  self.session_token = generate_unique_session_token
  self.save!
  self.session_token
end








def find_by_credentials(username, password)
  user = User.find_by(username: username)
  user && user.is_password?(password)? user : nil
end

def is_password?(password)
  bcrypt_obj = BCrpyt::Password.new(self.password_digest)
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
  @password = password
  password_digest = BCrypt::Password.new(password)
end

def ensure_session_token
  self.session_token ||= generate_unique_session_token
end

def reset_session_token
  self.session_token = generate_unique_session_token
  self.save!
  self.session_token
end