class AddMeetingAttendanceCountToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :meeting_attendances_count, :integer
  end
end
