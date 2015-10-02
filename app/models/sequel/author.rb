module Sequel
  class Author < Sequel::Model
    plugin :validation_helpers

    one_to_many :books

    def validate
      super
      validates_presence [:first_name, :last_name]
      validates_unique [:first_name, :last_name]
    end

    dataset_module do
      def name_like(name)
        where(
          Sequel.join([:first_name, :last_name], ' ').ilike("%#{name}%")
        )
      end
    end 

  end
end
