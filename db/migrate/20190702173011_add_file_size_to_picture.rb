class AddFileSizeToPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :file_size, :integer
  end
end
