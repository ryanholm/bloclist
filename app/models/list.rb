class List < ActiveRecord::Base
  validates_presence_of :name, allow_nil: false

  has_many :items
end
