class User
  include Mongoid::Document
  field :username, type: String
  field :password, type: String
  #has_secure_password
  #def self.authenticate(password)
  	

end
