class AddMeetingAttendanceCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :meeting_attendances_count, :integer
  end
end
