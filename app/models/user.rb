class User < ActiveRecord::Base
  # Remember to create a migration!
  def self.authenticate(username, password)
    self.find_by(username: username, password: password)
  end
end
