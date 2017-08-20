class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :poems
  has many :comments
end
