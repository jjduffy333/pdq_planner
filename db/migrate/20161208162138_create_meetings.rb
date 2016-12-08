class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.string :purpose
      t.string :benefit
      t.integer :check_id
      t.integer :user_id
      t.string :date
      t.string :time
      t.string :location

      t.timestamps

    end
  end
end
