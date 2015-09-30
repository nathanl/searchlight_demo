# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Author.destroy_all
Book.destroy_all
Category.destroy_all

'Childrens'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "The Runaway Bunny",
    author: Author.where(first_name: "Margaret", last_name: "Brown").first_or_create,
    category: category,
    board_book: true,
  )
  Book.create!(
    title: "The Cat in the Hat",
    author: Author.where(first_name: "Theodor", last_name: "Seuss").first_or_create,
    category: category
  )
  Book.create!(
    title: "The Magician's Nephew",
    author: Author.where(first_name: "CS", last_name: "Lewis").first_or_create,
    category: category
  )
  Book.create!(
    title: "Where the Sidewalk Ends",
    author: Author.where(first_name: "Shel", last_name: "Silverstein").first_or_create,
    category: category
  )
  Book.create!(
    title: "Trucks Go",
    author: Author.where(first_name: "Steve", last_name: "Light").first_or_create,
    category: category,
    board_book: true,
  )
end

'Cooking'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "Cookwise",
    author: Author.where(first_name: "Shirley", last_name: "Corriher").first_or_create,
    category: category
  )
  Book.create!(
    title: "New Vegetarian Cuisine",
    author: Author.where(first_name: "Linda", last_name: "Rosenweig").first_or_create,
    category: category
  )
end

'Poetry'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "Sailing Alone Around the Room",
    author: Author.where(first_name: "Billy", last_name: "Collins").first_or_create,
    category: category
  )
end

'Programming'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "Practical Object-Oriented Design in Ruby",
    author: Author.where(first_name: "Sandy", last_name: "Metz").first_or_create,
    category: category
  )
  Book.create!(
    title: "Eloquent Ruby",
    author: Author.where(first_name: "Russ", last_name: "Olsen").first_or_create,
    category: category
  )
  Book.create!(
    title: "Clean Code",
    author: Author.where(first_name: "Bob", last_name: "Martin").first_or_create,
    category: category
  )
  Book.create!(
    title: "Javascript: The Good Parts",
    author: Author.where(first_name: "Douglas", last_name: "Crockford").first_or_create,
    category: category
  )
  Book.create!(
    title: "CSS: The Definitive Guide",
    author: Author.where(first_name: "Eric", last_name: "Meyer").first_or_create,
    category: category
  )
end

'Religion'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "Don't Waste Your Life",
    author: Author.where(first_name: "John", last_name: "Piper").first_or_create,
    category: category
  )
  Book.create!(
    title: "Mere Christianity",
    author: Author.where(first_name: "CS", last_name: "Lewis").first_or_create,
    category: category
  )
end

'Science'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "The Code Book",
    author: Author.where(first_name: "Simon", last_name: "Singh").first_or_create,
    category: category
  )
  Book.create!(
    title: "Breakthroughs in Science",
    author: Author.where(first_name: "Isaac", last_name: "Asimov").first_or_create,
    category: category
  )
  Book.create!(
    title: "Guns, Germs and Steel",
    author: Author.where(first_name: "Jared", last_name: "Diamond").first_or_create,
    category: category
  )
end

'Science Fiction'.tap do |category_name|
  category = Category.create!(name: category_name)

  Book.create!(
    title: "The Caves of Steel",
    author: Author.where(first_name: "Isaac", last_name: "Asimov").first_or_create,
    category: category
  )
  Book.create!(
    title: "Out of the Silent Planet",
    author: Author.where(first_name: "CS", last_name: "Lewis").first_or_create,
    category: category
  )
  Book.create!(
    title: "Jurassic Park",
    author: Author.where(first_name: "Michael", last_name: "Crighton").first_or_create,
    category: category
  )
end
