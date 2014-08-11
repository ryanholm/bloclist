class List < ActiveRecord::Base
  validates_presence_of :name, allow_nil: false
end
