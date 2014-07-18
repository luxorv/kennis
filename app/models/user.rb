class User < ActiveRecord::Base
  # getters
  attr_accessor :username, :email, :password, :password_confirmation

  #scopes

  # callbacks

  before_save :encrypt_password

  # validations

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :username
  validates_uniqueness_of :email
  validates_uniqueness_of :username


  #instance methods

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  # class methods

  def self.authenticate(username, email, password)
    user = User.find_by_username(username) || User.find_by_email(email)
    hashed_password = BCrypt::Engine.hash_secret(password, user.password_salt)

    if user && user.password_hash == hashed_password
      user
    else
      nil
    end
  end
end
