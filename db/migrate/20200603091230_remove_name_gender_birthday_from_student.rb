class RemoveNameGenderBirthdayFromStudent < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :name, :string
    remove_column :students, :gender, :boolean
    remove_column :students, :birthday, :datetime
  end
end
