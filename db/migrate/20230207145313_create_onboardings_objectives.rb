class CreateOnboardingsObjectives < ActiveRecord::Migration[7.0]
  def change
    create_table :onboardings_objectives do |t|
      t.string :name
      t.text :description
      t.text :finished_message

      t.timestamps
    end
  end
end
