
module CollectionsHelper

  def categories_collection
    @categories_collection ||= Category.all.map {|cat| [cat.name, cat.id] }
  end

end
