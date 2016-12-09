class AddPersonCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :people_count, :integer
  end
end
