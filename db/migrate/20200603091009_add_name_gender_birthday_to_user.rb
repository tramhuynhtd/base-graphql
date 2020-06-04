class AddNameGenderBirthdayToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :boolean
    add_column :users, :birthday, :datetime
  end
end
