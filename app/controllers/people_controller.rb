class PeopleController < ApplicationController
  def index
    @q = Person.ransack(params[:q])
    @people = @q.result(:distinct => true).includes(:user, :meeting).page(params[:page]).per(10)

    render("people/index.html.erb")
  end

  def show
    @person = Person.find(params[:id])

    render("people/show.html.erb")
  end

  def new
    @person = Person.new

    render("people/new.html.erb")
  end

  def create
    @person = Person.new

    @person.user_id = params[:user_id]
    @person.name = params[:name]
    @person.photo = params[:photo]
    @person.relationship = params[:relationship]
    @person.phone = params[:phone]
    @person.email = params[:email]
    @person.meeting_id = params[:meeting_id]

    save_status = @person.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/people/new", "/create_person"
        redirect_to("/people")
      else
        redirect_back(:fallback_location => "/", :notice => "Person created successfully.")
      end
    else
      render("people/new.html.erb")
    end
  end

  def edit
    @person = Person.find(params[:id])

    render("people/edit.html.erb")
  end

  def update
    @person = Person.find(params[:id])

    @person.user_id = params[:user_id]
    @person.name = params[:name]
    @person.photo = params[:photo]
    @person.relationship = params[:relationship]
    @person.phone = params[:phone]
    @person.email = params[:email]
    @person.meeting_id = params[:meeting_id]

    save_status = @person.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/people/#{@person.id}/edit", "/update_person"
        redirect_to("/people/#{@person.id}", :notice => "Person updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Person updated successfully.")
      end
    else
      render("people/edit.html.erb")
    end
  end

  def destroy
    @person = Person.find(params[:id])

    @person.destroy

    if URI(request.referer).path == "/people/#{@person.id}"
      redirect_to("/", :notice => "Person deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Person deleted.")
    end
  end
end
