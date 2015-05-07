class Recipe
  include Mongoid::Document
  include Mongoid::Timestamps
  field :rName, type: String
  field :serving_size, type: String 
  field :ingredient, type: String
  field :instruction, type: String
  
  mount_uploader :photo, YeschefUploader

  belongs_to :user
  
  # embeds_many :components
  # accepts_nested_attributes_for :components

  validates :rName, presence: true, uniqueness: true
  validates :serving_size, presence: true
  validates :ingredient, presence: true
  validates :instruction, presence: {message: "requires instruction"}
  validates :photo, presence: {message: "requires photo"} 

end
