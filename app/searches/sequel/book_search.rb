# This search class assumes Sequel and ActionView
require "searchlight/adapters/action_view"

class Sequel::BookSearch < Searchlight::Search
  include Searchlight::Adapters::ActionView

  # todo seem to be getting everything correctly but category options seem
  # switched. I think the SQL is correct, we just have duplicate column names
  # and the action view adapter is grabbing the wrong one?

  def base_query
    Sequel::Book.order(Sequel.qualify(:books, :title))#.eager([:category, :author])
  end

  def options
    super.tap { |opts|
      opts[:in_print] ||= "either"
    }
  end

  def search_title_like
    query.where(Sequel.ilike(Sequel.qualify(:books, :title), "%#{options.fetch(:title_like)}%"))
  end

  def search_category_in
    query.where(Sequel.qualify(:books, :category_id) => options.fetch(:category_in).select {|v| filled?(v) })
  end

  def search_author_name_like
    query.inner_join(:authors, id: :author_id).where(Sequel.join([Sequel.qualify(:authors, :first_name), Sequel.qualify(:authors, :last_name)], ' ').ilike("%#{options.fetch(:author_name_like)}%"))
  end

  def search_author_also_wrote_in_category_id
    query.join(
      :authors, {id: :author_id}, {table_alias: :author_for_other_books, implicit_qualifier: :books}
    ).join(
      :books, {author_id: :id}, {table_alias: :other_books}
    ).join(
      :categories, {id: :category_id}, {table_alias: :other_categories}
    ).where(
      Sequel.qualify(:other_books, :category_id) => options.fetch(:author_also_wrote_in_category_id)
    )
  end

  def search_board_book
    query.where(Sequel.qualify(:books, :board_book) => checked?(options.fetch(:board_book)))
  end

  def search_in_print
    return query if options[:in_print].to_s == "either"
    query.where(Sequel.qualify(:books, :in_print), checked?(options[:in_print]))
  end

end
