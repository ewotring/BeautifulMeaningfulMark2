class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  has_many :poems
  has_many :comments
  # Update schema to reflect that users create comments

  validates :email, presence: true
  validate :validate_password

  def password
  	@password ||= Password.new(password_hash)
  end

  def password=(new_password)
  	@plain_text_password = new_password
  	@password = Password.create(new_password)
  	self.password_hash = @password
  end

  def authenticate(new_password)
  	self.password == new_password
  end

  def validate_password
  	if @plain_text_password.nil?
  		errors.add(:password, "cannot be blank")
  	end
  end
end
