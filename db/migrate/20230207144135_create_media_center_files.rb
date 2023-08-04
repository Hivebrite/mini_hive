class CreateMediaCenterFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :media_center_files do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
