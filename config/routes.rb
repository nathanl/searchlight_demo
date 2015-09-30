BookFinder::Application.routes.draw do
  get "/without_searchlight", controller: "books", action: "without_searchlight"
  get "/searchlight_activerecord", controller: "books", action: "searchlight_activerecord"
end
