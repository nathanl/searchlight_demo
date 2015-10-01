class BasicTables < ActiveRecord::Migration
  def change
    create_table "authors", force: :cascade do |t|
      t.string "first_name"
      t.string "last_name"

      t.timestamps
    end

    create_table "books", force: :cascade do |t|
      t.string  "title"
      t.integer "author_id"
      t.integer "category_id"
      t.boolean "board_book",  default: false
      t.boolean "in_print",    default: true

      t.timestamps
    end

    create_table "categories", force: :cascade do |t|
      t.string "name"

      t.timestamps
    end
  end
end
