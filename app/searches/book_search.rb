class BookSearch < Searchlight::Search

  search_on Book

  searches :title, :category_id, :author_name_like

  def search_title
    search.where(title: title)
  end

  def search_category_id
    search.joins(:category).where("categories.id = ?", category_id)
  end

  def search_author_name_like
    search.joins(:author).where("concat(authors.first_name, ' ', authors.last_name) ILIKE ?", "%#{author_name_like}%")
  end

end
