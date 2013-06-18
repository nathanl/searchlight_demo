# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Author.destroy_all
Book.destroy_all
Category.destroy_all

'Childrens'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "The Runaway Bunny",
    author: Author.find_or_create_by_first_name_and_last_name("Margaret", "Brown"),
    category: category
  )
  Book.create!(
    title: "The Cat in the Hat",
    author: Author.find_or_create_by_first_name_and_last_name("Theodor", "Seuss"),
    category: category
  )
  Book.create!(
    title: "The Magician's Nephew",
    author: Author.find_or_create_by_first_name_and_last_name("CS", "Lewis"),
    category: category
  )
  Book.create!(
    title: "Where the Sidewalk Ends",
    author: Author.find_or_create_by_first_name_and_last_name("Shel", "Silverstein"),
    category: category
  )
end

'Cooking'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "Cookwise",
    author: Author.find_or_create_by_first_name_and_last_name("Shirley", "Corriher"),
    category: category
  )
  Book.create!(
    title: "New Vegetarian Cuisine",
    author: Author.find_or_create_by_first_name_and_last_name("Linda", "Rosenweig"),
    category: category
  )
end

'Poetry'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "Sailing Alone Around the Room",
    author: Author.find_or_create_by_first_name_and_last_name("Billy", "Collins"),
    category: category
  )
end

'Programming'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "Practical Object-Oriented Design in Ruby",
    author: Author.find_or_create_by_first_name_and_last_name("Sandy", "Metz"),
    category: category
  )
  Book.create!(
    title: "Eloquent Ruby",
    author: Author.find_or_create_by_first_name_and_last_name("Russ", "Olsen"),
    category: category
  )
  Book.create!(
    title: "Clean Code",
    author: Author.find_or_create_by_first_name_and_last_name("Bob", "Martin"),
    category: category
  )
  Book.create!(
    title: "Javascript: The Good Parts",
    author: Author.find_or_create_by_first_name_and_last_name("Douglas", "Crockford"),
    category: category
  )
  Book.create!(
    title: "CSS: The Definitive Guide",
    author: Author.find_or_create_by_first_name_and_last_name("Eric", "Meyer"),
    category: category
  )
end

'Religion'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "Don't Waste Your Life",
    author: Author.find_or_create_by_first_name_and_last_name("John", "Piper"),
    category: category
  )
  Book.create!(
    title: "Mere Christianity",
    author: Author.find_or_create_by_first_name_and_last_name("CS", "Lewis"),
    category: category
  )
end

'Science'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "The Code Book",
    author: Author.find_or_create_by_first_name_and_last_name("Simon", "Singh"),
    category: category
  )
  Book.create!(
    title: "Breakthroughs in Science",
    author: Author.find_or_create_by_first_name_and_last_name("Isaac", "Asimov"),
    category: category
  )
  Book.create!(
    title: "Guns, Germs and Steel",
    author: Author.find_or_create_by_first_name_and_last_name("Jared", "Diamond"),
    category: category
  )
end

'Science Fiction'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "The Caves of Steel",
    author: Author.find_or_create_by_first_name_and_last_name("Isaac", "Asimov"),
    category: category
  )
  Book.create!(
    title: "Out of the Silent Planet",
    author: Author.find_or_create_by_first_name_and_last_name("CS", "Lewis"),
    category: category
  )
  Book.create!(
    title: "Jurassic Park",
    author: Author.find_or_create_by_first_name_and_last_name("Michael", "Crighton"),
    category: category
  )
end
