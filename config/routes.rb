Rails.application.routes.draw do
  # Routes for the Brewery resource:
  # CREATE
  get "/breweries/new", :controller => "breweries", :action => "new"
  post "/create_brewery", :controller => "breweries", :action => "create"

  # READ
  get "/breweries", :controller => "breweries", :action => "index"
  get "/breweries/:id", :controller => "breweries", :action => "show"

  # UPDATE
  get "/breweries/:id/edit", :controller => "breweries", :action => "edit"
  post "/update_brewery/:id", :controller => "breweries", :action => "update"

  # DELETE
  get "/delete_brewery/:id", :controller => "breweries", :action => "destroy"

  # SEARCH
  get "/brewery/find_brewery", :controller => "breweries", :action => "find_brewery"

  #------------------------------

  # Routes for the Comment resource:
  # CREATE
  get "/comments/new", :controller => "comments", :action => "new"
  post "/create_comment", :controller => "comments", :action => "create"

  # READ
  get "/comments", :controller => "comments", :action => "index"
  get "/comments/:id", :controller => "comments", :action => "show"

  # UPDATE
  get "/comments/:id/edit", :controller => "comments", :action => "edit"
  post "/update_comment/:id", :controller => "comments", :action => "update"

  # DELETE
  get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  #------------------------------

  # Routes for the Like resource:
  # CREATE
  get "/likes/new", :controller => "likes", :action => "new"
  post "/create_like", :controller => "likes", :action => "create"

  # READ
  get "/likes", :controller => "likes", :action => "index"
  get "/likes/:id", :controller => "likes", :action => "show"

  # UPDATE
  get "/likes/:id/edit", :controller => "likes", :action => "edit"
  post "/update_like/:id", :controller => "likes", :action => "update"

  # DELETE
  get "/delete_like/:id", :controller => "likes", :action => "destroy"
  #------------------------------

  # Routes for the Beer resource:
  root "beers#index"

  # CREATE
  get "/beers/new", :controller => "beers", :action => "new"
  post "/create_beer", :controller => "beers", :action => "create"

  # READ
  get "/beers", :controller => "beers", :action => "index"
  get "/beers/:id", :controller => "beers", :action => "show"

  # UPDATE
  get "/beers/:id/edit", :controller => "beers", :action => "edit"
  post "/update_beer/:id", :controller => "beers", :action => "update"

  # DELETE
  get "/delete_beer/:id", :controller => "beers", :action => "destroy"

  # SEARCH
  get "/beer/find_beer", :controller => "beers", :action => "find_beer"

  #------------------------------

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users/:id", :controller => "users", :action => "show"
  get "/my_likes", :controller => "users", :action => "my_likes"

end
