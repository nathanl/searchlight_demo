class BooksController < ApplicationController

  def searchlight_activerecord
    @search = BookSearch.new(search_params)
    @books  = @search.results
  end

  def without_searchlight
    # @books  = @search.results
  end

  protected

  def search_params
    @search_params ||= params.delete(:book_search) || {}
  end

end
