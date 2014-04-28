class CreateAutographs < ActiveRecord::Migration
  def change
    create_table :autographs do |t|
      t.string :name

      t.timestamps
    end
  end
end
