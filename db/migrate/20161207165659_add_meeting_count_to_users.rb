class AddMeetingCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :meetings_count, :integer
  end
end
