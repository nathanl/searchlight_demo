module Sequel
  class Book < Sequel::Model
    plugin :validation_helpers

    many_to_one :author
    many_to_one :category

    def validate
      super
      validates_presence [:author, :category, :title]
      validates_unique [:title, :author_id, :category_id]
    end
    
    dataset_module do
      def title_like(title)
        where("title ILIKE ?", "%#{title}%")
      end
    end 
  end
end
