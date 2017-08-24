class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :poems
  has_many :comments
  # Update schema to reflect that users create comments
end

testing words
