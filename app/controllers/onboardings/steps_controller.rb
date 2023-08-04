class Onboardings::StepsController < ApplicationController

  before_action do
    redirect_to '/', alert: 'you cannot access this page' unless current_user.admin?
  end
  
  before_action :set_onboardings_step, only: %i[ show edit update destroy ]

  # GET /onboardings/steps or /onboardings/steps.json
  def index
    @onboardings_steps = Onboardings::Step.all
  end

  # GET /onboardings/steps/1 or /onboardings/steps/1.json
  def show
  end

  # GET /onboardings/steps/new
  def new
    @onboardings_objective = Onboardings::Objective.find(params[:parent_objective_id])
    @onboardings_step = @onboardings_objective.steps.build
  end

  # GET /onboardings/steps/1/edit
  def edit
  end

  # POST /onboardings/steps or /onboardings/steps.json
  def create
    @onboardings_step = Onboardings::Step.new(onboardings_step_params)

    respond_to do |format|
      if @onboardings_step.save
        format.html { redirect_to edit_onboardings_objective_url(@onboardings_step.objective), notice: "Step was successfully created." }
        format.json { render :show, status: :created, location: @onboardings_step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @onboardings_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /onboardings/steps/1 or /onboardings/steps/1.json
  def update
    respond_to do |format|
      if @onboardings_step.update(onboardings_step_params)
        format.html { redirect_to edit_onboardings_objective_url(@onboardings_step.objective), notice: "Step was successfully updated." }
        format.json { render :show, status: :ok, location: @onboardings_step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @onboardings_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onboardings/steps/1 or /onboardings/steps/1.json
  def destroy
    @onboardings_step.destroy

    respond_to do |format|
      format.html { redirect_to edit_onboardings_objective_url(@onboardings_step.objective), notice: "Step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onboardings_step
      @onboardings_step = Onboardings::Step.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def onboardings_step_params
      params.require(:onboardings_step).permit(:list_id, :objective_id, :resource_global_id, :resource_type)
    end
end
