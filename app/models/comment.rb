class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :post, type: String
  
  belongs_to :user
  embeds_one :recipe
end
