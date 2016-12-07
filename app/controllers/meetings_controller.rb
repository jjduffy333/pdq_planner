class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all

    render("meetings/index.html.erb")
  end

  def show
    @meeting = Meeting.find(params[:id])

    render("meetings/show.html.erb")
  end

  def new
    @meeting = Meeting.new

    render("meetings/new.html.erb")
  end

  def create
    @meeting = Meeting.new

    @meeting.user_id = params[:user_id]
    @meeting.title = params[:title]
    @meeting.purpose = params[:purpose]
    @meeting.benefit = params[:benefit]
    @meeting.check_id = params[:check_id]

    save_status = @meeting.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/meetings/new", "/create_meeting"
        redirect_to("/meetings")
      else
        redirect_back(:fallback_location => "/", :notice => "Meeting created successfully.")
      end
    else
      render("meetings/new.html.erb")
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])

    render("meetings/edit.html.erb")
  end

  def update
    @meeting = Meeting.find(params[:id])

    @meeting.user_id = params[:user_id]
    @meeting.title = params[:title]
    @meeting.purpose = params[:purpose]
    @meeting.benefit = params[:benefit]
    @meeting.check_id = params[:check_id]

    save_status = @meeting.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/meetings/#{@meeting.id}/edit", "/update_meeting"
        redirect_to("/meetings/#{@meeting.id}", :notice => "Meeting updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Meeting updated successfully.")
      end
    else
      render("meetings/edit.html.erb")
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])

    @meeting.destroy

    if URI(request.referer).path == "/meetings/#{@meeting.id}"
      redirect_to("/", :notice => "Meeting deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Meeting deleted.")
    end
  end
end
