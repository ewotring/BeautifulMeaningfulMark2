class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :poem
  belongs_to :user
end
