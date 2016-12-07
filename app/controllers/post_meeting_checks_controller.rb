class PostMeetingChecksController < ApplicationController
  def index
    @post_meeting_checks = PostMeetingCheck.all

    render("post_meeting_checks/index.html.erb")
  end

  def show
    @post_meeting_check = PostMeetingCheck.find(params[:id])

    render("post_meeting_checks/show.html.erb")
  end

  def new
    @post_meeting_check = PostMeetingCheck.new

    render("post_meeting_checks/new.html.erb")
  end

  def create
    @post_meeting_check = PostMeetingCheck.new

    @post_meeting_check.check_id = params[:check_id]
    @post_meeting_check.user_id = params[:user_id]
    @post_meeting_check.task = params[:task]
    @post_meeting_check.description = params[:description]
    @post_meeting_check.next_check_date = params[:next_check_date]

    save_status = @post_meeting_check.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/post_meeting_checks/new", "/create_post_meeting_check"
        redirect_to("/post_meeting_checks")
      else
        redirect_back(:fallback_location => "/", :notice => "Post meeting check created successfully.")
      end
    else
      render("post_meeting_checks/new.html.erb")
    end
  end

  def edit
    @post_meeting_check = PostMeetingCheck.find(params[:id])

    render("post_meeting_checks/edit.html.erb")
  end

  def update
    @post_meeting_check = PostMeetingCheck.find(params[:id])

    @post_meeting_check.check_id = params[:check_id]
    @post_meeting_check.user_id = params[:user_id]
    @post_meeting_check.task = params[:task]
    @post_meeting_check.description = params[:description]
    @post_meeting_check.next_check_date = params[:next_check_date]

    save_status = @post_meeting_check.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/post_meeting_checks/#{@post_meeting_check.id}/edit", "/update_post_meeting_check"
        redirect_to("/post_meeting_checks/#{@post_meeting_check.id}", :notice => "Post meeting check updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Post meeting check updated successfully.")
      end
    else
      render("post_meeting_checks/edit.html.erb")
    end
  end

  def destroy
    @post_meeting_check = PostMeetingCheck.find(params[:id])

    @post_meeting_check.destroy

    if URI(request.referer).path == "/post_meeting_checks/#{@post_meeting_check.id}"
      redirect_to("/", :notice => "Post meeting check deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Post meeting check deleted.")
    end
  end
end
