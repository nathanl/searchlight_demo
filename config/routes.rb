SearchlightDemo::Application.routes.draw do
  root controller: "books", action: "home"
  get "/without_searchlight", controller: "books", action: "without_searchlight"
  get "/searchlight_activerecord", controller: "books", action: "searchlight_activerecord"
  get "/searchlight_sequel", controller: "books", action: "searchlight_sequel"
  mount SinatraSearchlight => "/sinatra_searchlight"
end
