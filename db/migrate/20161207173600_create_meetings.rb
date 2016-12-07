class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :user_id
      t.string :title
      t.string :purpose
      t.string :benefit
      t.integer :check_id

      t.timestamps

    end
  end
end
