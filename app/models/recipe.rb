class Recipe
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :serving_size, type: Integer 
  field :equipment, type: String
  field :ingredient, type: String
  field :direction, type: String
  

  #embeds_many :ingredients
  # embeds_many :comments

  # embedded_in :username
end
