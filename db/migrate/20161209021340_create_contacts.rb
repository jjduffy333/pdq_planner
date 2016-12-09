class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :name
      t.string :photo
      t.string :relationship
      t.string :phone
      t.integer :meeting_id

      t.timestamps

    end
  end
end
