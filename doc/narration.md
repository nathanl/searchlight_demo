# Searchlight demo video

Searchlight is a lightweight search gem. It helps you build searches, using form options, without getting in your way. [show README]

In this demo, I'll show you a basic search, explain how it works, and develop something slightly more complex.

We'll be using a small Rails app running on PostgreSQL. [ show Gemfile ]

Here we have search form that filters the list of books below. The form uses the "remote" option, and the results are updated using Javascript.

Currently, we can search using the exact title of a book. Anything besides exact title won't work. We can also search by category.

Here's our search class. It has three basic parts:

- `search_on Book` says that `Book` is our search target, or the starting point.
- `searches :title` says that our search will accept a `:title` option, and...
- the `search_title` method is what it will run if it *does* get a title option

[ show console]
Searchlight is meant to work with forms, so it knows how to ignore blank options like you might get from a form. If we instantiate a search with a title and category id and ask for its options, it tells us those. If we omit title, or give it a blank one, it reports only the options it can use.

Searchlight builds searches by chaining method calls. Here we're using ActiveRecord. As you may know, ActiveRecord's query methods return an instance of `ActiveRecord::Relation`. This is why you can keep chaining: `Book.where(...).joins(...).where(...).includes(...).limit(...)`, etc.

Our search class uses the options its given and any corresponding methods to build a chain of those method calls. It starts from the search target and calls each relevant method. Inside each search method, `search` refers to the chain that's been built up to that point.

So, if we make a search with a title and a category id (walk through calls). If we omit the title option, `search_title` won't be called. If we go back and modify our search target to have an `order`, that just becomes part of the chain: `Book.order(...).where(...)`, etc

Before we make our search more complex, here's how we're using the search class in this app.

[show form] The search form uses `form_for @search`, which is an instance of our search class. [show controller] With each request, the controller builds a new search instance using the options from the form. With no options to filter by, the search will return all books.

Let's add the ability to search using any part of the author's name. [add search option and paste in method] Here we join the authors table, build a string representing the full name, and do a case-insensitive match using Postgres syntax. [paste in form code] We also add an input to the form. [do search like 'U' then like 'el silver']

Let's do something harder. [fade to updated form] Here we can search using other books the author wrote. For instance, let's get science fiction books by authors who also wrote for children.

For this search method, we break out some SQL, join and alias tables, etc. This goes to show that all of the ORM's power is available in your Searchlight classes.

That includes any existing scopes. If we already have a scope for finding authors by name, we can make use of that here.

And that's it! An almost-exhaustive tour of Searchlight in just a few minutes. For the few bits we didn't cover, check out the thorough README on Github.

Thanks for watching!
