class SharedMeetingsController < ApplicationController
  before_action :current_user_must_be_shared_meeting_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_shared_meeting_user
    shared_meeting = SharedMeeting.find(params[:id])

    unless current_user == shared_meeting.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.shared_meetings.ransack(params[:q])
      @shared_meetings = @q.result(:distinct => true).includes(:user, :people).page(params[:page]).per(10)

    render("shared_meetings/index.html.erb")
  end

  def show
    @person = Person.new
    @shared_meeting = SharedMeeting.find(params[:id])

    render("shared_meetings/show.html.erb")
  end

  def new
    @shared_meeting = SharedMeeting.new

    render("shared_meetings/new.html.erb")
  end

  def create
    @shared_meeting = SharedMeeting.new

    @shared_meeting.user_id = params[:user_id]

    save_status = @shared_meeting.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/shared_meetings/new", "/create_shared_meeting"
        redirect_to("/shared_meetings")
      else
        redirect_back(:fallback_location => "/", :notice => "Shared meeting created successfully.")
      end
    else
      render("shared_meetings/new.html.erb")
    end
  end

  def edit
    @shared_meeting = SharedMeeting.find(params[:id])

    render("shared_meetings/edit.html.erb")
  end

  def update
    @shared_meeting = SharedMeeting.find(params[:id])

    @shared_meeting.user_id = params[:user_id]

    save_status = @shared_meeting.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/shared_meetings/#{@shared_meeting.id}/edit", "/update_shared_meeting"
        redirect_to("/shared_meetings/#{@shared_meeting.id}", :notice => "Shared meeting updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Shared meeting updated successfully.")
      end
    else
      render("shared_meetings/edit.html.erb")
    end
  end

  def destroy
    @shared_meeting = SharedMeeting.find(params[:id])

    @shared_meeting.destroy

    if URI(request.referer).path == "/shared_meetings/#{@shared_meeting.id}"
      redirect_to("/", :notice => "Shared meeting deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Shared meeting deleted.")
    end
  end
end
