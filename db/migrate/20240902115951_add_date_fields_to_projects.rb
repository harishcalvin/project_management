class AddDateFieldsToProjects < ActiveRecord::Migration[7.2]
  def change
    add_column :projects, :project_start_date, :date, default: nil
    add_column :projects, :project_est_end_date, :date, default: nil
  end
end
