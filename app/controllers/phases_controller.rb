# app/controllers/phases_controller.rb
class PhasesController < ApplicationController
  before_action :set_phase, only: %i[show edit update destroy]
  before_action :set_project, only: %i[new create update destroy]

  # GET /phases or /phases.json
  def index
    @phases = Phase.all
  end

  # GET /phases/1 or /phases/1.json
  def show
  end

  # GET /projects/:project_id/phases/new
  def new
    @phase = @project.phases.new
  end

  # GET /phases/1/edit
  def edit
  end

  # POST /projects/:project_id/phases or /projects/:project_id/phases.json
  def create
    @phase = @project.phases.new(phase_params)

    respond_to do |format|
      if @phase.save
        format.html { redirect_to project_phase_path(@project, @phase), notice: "Phase was successfully created." }
        format.json { render :show, status: :created, location: @phase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phases/1 or /phases/1.json
  def update
    respond_to do |format|
      if @phase.update(phase_params)
        format.html { redirect_to project_phase_path(@project, @phase), notice: "Phase was successfully updated." }
        format.json { render :show, status: :ok, location: @phase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phases/1 or /phases/1.json
  def destroy
    @phase.destroy!

    respond_to do |format|
      format.html { redirect_to project_path(@project, tab: "phases"), notice: "Phase was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_phase
    @phase = Phase.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  # Only allow a list of trusted parameters through.
  def phase_params
    params.require(:phase).permit(:title, :description, :client_description, :status, :start_date, :end_end,
      milestones_attributes: [:id, :title, :description, :internal, :client_facing, :completed, :_destroy])
  end
end
