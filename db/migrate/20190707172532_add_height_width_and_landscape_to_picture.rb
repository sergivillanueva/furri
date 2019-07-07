class AddHeightWidthAndLandscapeToPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :height, :integer
    add_column :pictures, :width, :integer
    add_column :pictures, :landscape, :boolean
  end
end
