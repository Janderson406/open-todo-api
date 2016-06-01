class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  #enum permissions [:private, :viewable, :open]
  #validates :permissions, inclusion: { in: %w(private viewable open), message: '%{value} is not valid.'}
end
