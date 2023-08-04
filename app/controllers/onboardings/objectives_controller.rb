class Onboardings::ObjectivesController < ApplicationController
  
  before_action do
    redirect_to '/', alert: 'you cannot access this page' unless current_user.admin?
  end
  
  before_action :set_onboardings_objective, only: %i[ show edit update destroy ]

  # GET /onboardings/objectives or /onboardings/objectives.json
  def index
    @onboardings_objectives = Onboardings::Objective.all
  end

  # GET /onboardings/objectives/1 or /onboardings/objectives/1.json
  def show
  end

  # GET /onboardings/objectives/new
  def new
    @onboardings_objective = Onboardings::Objective.new
  end

  # GET /onboardings/objectives/1/edit
  def edit
  end

  # POST /onboardings/objectives or /onboardings/objectives.json
  def create
    @onboardings_objective = Onboardings::Objective.new(onboardings_objective_params)

    respond_to do |format|
      if @onboardings_objective.save
        format.html { redirect_to edit_onboardings_objective_url(@onboardings_objective), notice: "Objective was successfully created." }
        format.json { render :show, status: :created, location: @onboardings_objective }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @onboardings_objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /onboardings/objectives/1 or /onboardings/objectives/1.json
  def update
    respond_to do |format|
      if @onboardings_objective.update(onboardings_objective_params)
        format.html { redirect_to edit_onboardings_objective_url(@onboardings_objective), notice: "Objective was successfully updated." }
        format.json { render :show, status: :ok, location: @onboardings_objective }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @onboardings_objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onboardings/objectives/1 or /onboardings/objectives/1.json
  def destroy
    @onboardings_objective.destroy

    respond_to do |format|
      format.html { redirect_to onboardings_objectives_url, notice: "Objective was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onboardings_objective
      @onboardings_objective = Onboardings::Objective.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def onboardings_objective_params
      params.require(:onboardings_objective).permit(:name, :description, :finished_message)
    end
end
