Rails.application.routes.draw do
  # Routes for the Person resource:
  # CREATE
  get "/people/new", :controller => "people", :action => "new"
  post "/create_person", :controller => "people", :action => "create"

  # READ
  get "/people", :controller => "people", :action => "index"
  get "/people/:id", :controller => "people", :action => "show"

  # UPDATE
  get "/people/:id/edit", :controller => "people", :action => "edit"
  post "/update_person/:id", :controller => "people", :action => "update"

  # DELETE
  get "/delete_person/:id", :controller => "people", :action => "destroy"
  #------------------------------

  # Routes for the Post_meeting_check resource:
  # CREATE
  get "/post_meeting_checks/new", :controller => "post_meeting_checks", :action => "new"
  post "/create_post_meeting_check", :controller => "post_meeting_checks", :action => "create"

  # READ
  get "/post_meeting_checks", :controller => "post_meeting_checks", :action => "index"
  get "/post_meeting_checks/:id", :controller => "post_meeting_checks", :action => "show"

  # UPDATE
  get "/post_meeting_checks/:id/edit", :controller => "post_meeting_checks", :action => "edit"
  post "/update_post_meeting_check/:id", :controller => "post_meeting_checks", :action => "update"

  # DELETE
  get "/delete_post_meeting_check/:id", :controller => "post_meeting_checks", :action => "destroy"
  #------------------------------

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
