class AddSharedMeetingCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :shared_meetings_count, :integer
  end
end
