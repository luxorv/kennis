class RegistrationService

  def self.register(user)
    old_user = User.where(username: user[:username]).first
    old_user || User.new(user)
  end
end
