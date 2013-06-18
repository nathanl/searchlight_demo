class CreateBooksAuthorsAndSubjects < ActiveRecord::Migration
  def up
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
    end

    create_table :categories do |t|
      t.string :name
    end

    create_table :books do |t|
      t.string  :title
      t.integer :author_id
      t.integer :category_id
    end
  end

  def down
    drop_table :books
    drop_table :categories
    drop_table :authors
  end
end
