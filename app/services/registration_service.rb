class RegistrationService

  def self.register(user)
    old_user = User.where(username: user[:username]).first
    old_user || User.new.tap do |new_user|
      new_user.username = user[:username]
      new_user.name = user[:name]
      new_user.email = user[:email]
      new_user.save
    end
  end
end
