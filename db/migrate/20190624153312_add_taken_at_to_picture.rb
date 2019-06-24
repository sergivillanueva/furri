class AddTakenAtToPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :taken_at, :datetime
  end
end
