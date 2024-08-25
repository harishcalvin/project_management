class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    if params[:status].present?
      @projects = Project.where(status: params[:status])
    else
      @projects = Project.all
    end
    @projects = @projects.includes(:phases) # This will eager load phases if needed
  end

  # GET /projects/1 or /projects/1.json
  def show
    @project = Project.find(params[:id])
    if params[:phase_status].present?
      @phases = @project.phases.where(status: params[:phase_status])
    else
      @phases = @project.phases
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to project_url(@project), notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end  # This 'end' should be aligned with the 'def create'

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy!

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :description, :application_number, :status)
    end
end
