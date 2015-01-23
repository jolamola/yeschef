class Component
  include Mongoid::Document
  field :cName, type: String
  field :direction, type: String
  field :ingredient, type: String

  embedded_in :recipe
  
end
