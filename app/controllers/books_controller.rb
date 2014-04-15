class BooksController < ApplicationController

  def index
    @search = BookSearch.new(search_params)
    @books  = @search.results
  end

  protected

  def search_params
    @search_params ||= params.delete(:book_search) || {}
  end

end
