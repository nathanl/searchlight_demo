# This search class assumes Sequel and ActionView
require "searchlight/adapters/action_view"

class Sequel::BookSearch < Searchlight::Search
  include Searchlight::Adapters::ActionView

  def base_query
    Sequel::Book.order(:title).eager([:category, :author])
  end

  def options
    super.tap { |opts|
      opts[:in_print] ||= "either"
    }
  end

  def search_title_like
    query.where(Sequel.ilike(:title, "%#{options.fetch(:title_like)}%"))
  end

  def search_category_id
    query.where(category_id: options.fetch(:category_id ))
  end

  def search_author_name_like
    #: see https://stackoverflow.com/questions/32885228/does-sequel-have-anything-like-activerecords-merge-method
    query.association_join(:author).where(Sequel.join([:first_name, :last_name], ' ').ilike("%#{options.fetch(:author_name_like)}%"))
  end

  # TODO - figure out how to do this with Sequel
  def search_author_also_wrote_in_category_id
    query_string = <<-YE_OLDE_QUERY_LANGUAGE.strip_heredoc
    INNER JOIN authors                        ON books.author_id         = authors.id
    INNER JOIN books      AS other_books      ON other_books.author_id   = authors.id
    INNER JOIN categories AS other_categories ON other_books.category_id = other_categories.id
    YE_OLDE_QUERY_LANGUAGE
    query.joins(query_string).where("other_categories.id = ?", options[:author_also_wrote_in_category_id])
  end

  def search_board_book
    query.where(board_book: checked?(options.fetch(:board_book)))
  end

  def search_in_print
    return query if options[:in_print].to_s == "either"
    query.where(in_print: checked?(options[:in_print]))
  end

end
