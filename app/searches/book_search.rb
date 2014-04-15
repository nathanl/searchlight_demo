class BookSearch < Searchlight::Search

  search_on Book.all

  searches :title, :category_id, :author_name_like, :author_also_wrote_in_category_id

  def search_title
    search.where(title: title)
  end

  def search_category_id
    search.joins(:category).where("categories.id = ?", category_id)
  end

  def search_author_name_like
    search.joins(:author).merge(Author.name_like(author_name_like))
  end

  def search_author_also_wrote_in_category_id
    query_string = <<-YE_OLDE_QUERY_LANGUAGE.strip_heredoc
    INNER JOIN authors                        ON books.author_id         = authors.id
    INNER JOIN books      AS other_books      ON other_books.author_id   = authors.id
    INNER JOIN categories AS other_categories ON other_books.category_id = other_categories.id
    YE_OLDE_QUERY_LANGUAGE
    search.joins(query_string).where("other_categories.id = ?", author_also_wrote_in_category_id)
  end

end
