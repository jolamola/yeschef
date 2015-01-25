class Recipe
  include Mongoid::Document
  include Mongoid::Timestamps
  field :rName, type: String
  field :description, type: String
  field :serving_size, type: Integer 
  field :equipment, type: String
  
  mount_uploader :photo, YeschefUploader

  belongs_to :user
  
  embeds_many :components
  accepts_nested_attributes_for :components

  
end
