class CreateMilestones < ActiveRecord::Migration[7.2]
  def change
    # Table already exists, so we don't need to do anything
    create_table :milestones, if_not_exists: true do |t|
      t.string :title
      t.text :description
      t.boolean :internal
      t.boolean :client_facing
      t.boolean :completed
      t.references :phase, foreign_key: true

      t.timestamps
    end
  end
end
