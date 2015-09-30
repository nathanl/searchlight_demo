class AddBooksBoardBook < ActiveRecord::Migration
  def change
    add_column :books, :board_book, :boolean, default: false
  end
end
