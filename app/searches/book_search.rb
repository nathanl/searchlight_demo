class BookSearch < Searchlight::Search

  search_on Book

  searches :title, :category_id

  def search_title
    search.where(title: title)
  end

  def search_category_id
    search.joins(:category).where("categories.id = ?", category_id)
  end

end
