class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  field :password_digest, type: String

  has_secure_password
  
  has_many :recipes

  validates :email, uniqueness: true
  validates :password, confirmation: true
end
	