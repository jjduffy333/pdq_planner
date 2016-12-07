class AddPostMeetingCheckCountToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :post_meeting_checks_count, :integer
  end
end
