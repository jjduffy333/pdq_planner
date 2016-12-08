class CreatePostMeetingChecks < ActiveRecord::Migration
  def change
    create_table :post_meeting_checks do |t|
      t.integer :check_id
      t.integer :user_id
      t.string :task
      t.text :description
      t.string :next_check_date

      t.timestamps

    end
  end
end
