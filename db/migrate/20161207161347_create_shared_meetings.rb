class CreateSharedMeetings < ActiveRecord::Migration
  def change
    create_table :shared_meetings do |t|
      t.integer :user_id

      t.timestamps

    end
  end
end
