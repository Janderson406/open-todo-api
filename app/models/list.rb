class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  enum permissions: [:secure, :viewable, :open]
  validates :permissions, inclusion: { in: %w(secure viewable open), message: '%{value} is not valid.'}
end
