class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  enum permissions [:private, :viewable, open]
  
end
