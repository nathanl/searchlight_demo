class BooksController < ApplicationController

  def index
    @search = BookSearch.new(search_params)
    @books  = @search.results
  end

  protected

  def search_params
    params.delete(:search) || {}
  end

end
