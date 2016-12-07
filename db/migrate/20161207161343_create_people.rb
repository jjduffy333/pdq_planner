class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :user_id
      t.string :name
      t.string :photo
      t.string :relationship
      t.string :phone
      t.string :email
      t.integer :meeting_id

      t.timestamps

    end
  end
end
