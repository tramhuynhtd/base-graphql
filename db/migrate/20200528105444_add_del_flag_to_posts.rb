class AddDelFlagToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :del_flag, :boolean
  end
end
