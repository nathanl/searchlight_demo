# Searchlight Demo

[Searchlight](https://github.com/nathanl/searchlight) is a Ruby gem for doing searches with ORMs, and this is the code behind [its demo app](https://bookfinder-searchlight-demo.herokuapp.com/).

## Usage

Bundle install, `rake db:seed` to load example data, and `rails s` to start.

## Gotchas

- It's kind of crazy to use both `sequel_rails` and `activerecord` in the same app, but I'm doing it here to show that Searchlight works with both. This means `db:migrate` doesn't work unless you comment out `sequel_rails` in the Gemfile and bundle. Extra fun if deploying and migrating.
