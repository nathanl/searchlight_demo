module Sequel
  class Category < Sequel::Model
    plugin :validation_helpers

    one_to_many :books

    def validate
      super
      validates_presence :name
      validates_unique :name
    end

  end
end
