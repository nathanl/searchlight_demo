class AddBooksInPrintColumn < ActiveRecord::Migration
  def change
    add_column :books, :in_print, :boolean, default: true
  end
end
