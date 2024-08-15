json.extract! project, :id, :title, :description, :application_number, :status, :created_at, :updated_at
json.url project_url(project, format: :json)
