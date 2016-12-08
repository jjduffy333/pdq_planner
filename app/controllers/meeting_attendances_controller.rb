class MeetingAttendancesController < ApplicationController
  def index
    @q = MeetingAttendance.ransack(params[:q])
    @meeting_attendances = @q.result(:distinct => true).includes(:user, :meeting).page(params[:page]).per(10)

    render("meeting_attendances/index.html.erb")
  end

  def show
    @meeting_attendance = MeetingAttendance.find(params[:id])

    render("meeting_attendances/show.html.erb")
  end

  def new
    @meeting_attendance = MeetingAttendance.new

    render("meeting_attendances/new.html.erb")
  end

  def create
    @meeting_attendance = MeetingAttendance.new

    @meeting_attendance.meeting_id = params[:meeting_id]
    @meeting_attendance.user_id = params[:user_id]

    save_status = @meeting_attendance.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/meeting_attendances/new", "/create_meeting_attendance"
        redirect_to("/meeting_attendances")
      else
        redirect_back(:fallback_location => "/", :notice => "Meeting attendance created successfully.")
      end
    else
      render("meeting_attendances/new.html.erb")
    end
  end

  def edit
    @meeting_attendance = MeetingAttendance.find(params[:id])

    render("meeting_attendances/edit.html.erb")
  end

  def update
    @meeting_attendance = MeetingAttendance.find(params[:id])

    @meeting_attendance.meeting_id = params[:meeting_id]
    @meeting_attendance.user_id = params[:user_id]

    save_status = @meeting_attendance.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/meeting_attendances/#{@meeting_attendance.id}/edit", "/update_meeting_attendance"
        redirect_to("/meeting_attendances/#{@meeting_attendance.id}", :notice => "Meeting attendance updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Meeting attendance updated successfully.")
      end
    else
      render("meeting_attendances/edit.html.erb")
    end
  end

  def destroy
    @meeting_attendance = MeetingAttendance.find(params[:id])

    @meeting_attendance.destroy

    if URI(request.referer).path == "/meeting_attendances/#{@meeting_attendance.id}"
      redirect_to("/", :notice => "Meeting attendance deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Meeting attendance deleted.")
    end
  end
end
