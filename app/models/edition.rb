class Edition < ActiveRecord::Base
  self.inheritance_column = :_type_disabled
  belongs_to :book
  belongs_to :publisher
end
