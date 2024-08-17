class CreatePhases < ActiveRecord::Migration[7.2]
  def change
    create_table :phases do |t|
      t.string :title
      t.text :description
      t.string :status
      t.date :start_date
      t.date :end_end
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
