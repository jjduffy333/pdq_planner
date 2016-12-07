Rails.application.routes.draw do
  # Routes for the Meeting resource:
  # CREATE
  get "/meetings/new", :controller => "meetings", :action => "new"
  post "/create_meeting", :controller => "meetings", :action => "create"

  # READ
  get "/meetings", :controller => "meetings", :action => "index"
  get "/meetings/:id", :controller => "meetings", :action => "show"

  # UPDATE
  get "/meetings/:id/edit", :controller => "meetings", :action => "edit"
  post "/update_meeting/:id", :controller => "meetings", :action => "update"

  # DELETE
  get "/delete_meeting/:id", :controller => "meetings", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
