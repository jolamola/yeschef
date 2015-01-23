class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  field :password_digest, type: String

  has_secure_password
  
  # embeds_many :recipes
  # accepts_nested_attributes_for :recipes
  # has_many :comments 

  validates :email, uniqueness: true
  validates :password, confirmation: true
end
	