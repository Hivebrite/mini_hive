class CreateOnboardingsSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :onboardings_steps do |t|
      t.references :objective, null: false, foreign_key: {to_table: :onboardings_objectives}
      t.references :resource, polymorphic: true, null: false

      t.timestamps
    end
  end
end
