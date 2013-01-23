class User < ActiveApplication::User
  rolify
  has_many :blogs
end
