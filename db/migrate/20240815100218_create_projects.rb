class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :application_number
      t.string :status

      t.timestamps
    end
  end
end
