class AddImageToAutograph < ActiveRecord::Migration
  def change
    add_column :autographs, :image, :binary
  end
end
