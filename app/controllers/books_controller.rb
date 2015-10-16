class BooksController < ApplicationController

  def searchlight_activerecord
    @search = BookSearch.new(search_params)
    @books  = @search.results
  end

  def searchlight_sequel
    @search = Sequel::BookSearch.new(search_params)
    if true
      @books  = @search.results.all
    else
      render text: @search.results.sql
    end
  end

  def without_searchlight
    @books = Book.all.order("title ASC")

    if search_params[:title_like].present?
      @books = @books.merge(Book.title_like(search_params[:title_like]))
    end

    if search_params[:author_name_like].present?
      @books = @books.joins(:author).merge(Author.name_like(search_params[:author_name_like]))
    end

    if search_params[:category_in].present?
      @books = @books.where(category_id: search_params.fetch(:category_in).select {|v| v.present? })
    end

    if search_params[:author_also_wrote_in_category_id].present?
      query_string = <<-YE_OLDE_QUERY_LANGUAGE.strip_heredoc
      INNER JOIN authors                        ON books.author_id         = authors.id
      INNER JOIN books      AS other_books      ON other_books.author_id   = authors.id
      INNER JOIN categories AS other_categories ON other_books.category_id = other_categories.id
      YE_OLDE_QUERY_LANGUAGE
      @books = @books.joins(query_string).where("other_categories.id = ?", search_params[:author_also_wrote_in_category_id])
    end

    if search_params[:board_book].present?
      @books = @books.where(board_book: search_params[:board_book])
    end

    search_params[:in_print] ||= "either"
    unless search_params[:in_print].to_s == "either"
      @books = @books.where(in_print: search_params[:in_print])
    end
  end

  protected

  def search_params
    @search_params ||= params.delete(:book_search) || params.delete(:sequel_book_search) || {}
  end

end
