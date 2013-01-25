module ActiveApplication
  class User < ActiveRecord::Base
    devise :database_authenticatable, :registerable, :confirmable,
      :recoverable, :rememberable, :trackable, :validatable

    def to_s
      email
    end
  end
end
