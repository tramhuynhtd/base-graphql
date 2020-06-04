class RemoveNameGenderBirthdayFromTeacher < ActiveRecord::Migration[6.0]
  def change
    remove_column :teachers, :name, :string
    remove_column :teachers, :gender, :boolean
    remove_column :teachers, :birthday, :datetime
  end
end
