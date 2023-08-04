class Onboardings::TourStepsController < ApplicationController

  def index
    @onboardings_objective = Onboardings::Objective.find(params[:objective_id])
    @current_step_id = :start

    render :show
  end
  
  def show
    @onboardings_objective = Onboardings::Objective.find(params[:objective_id])

    if params[:id] == "start"
      @current_step_id = params[:id].to_sym
    elsif params[:id] == "done"
      redirect_to '/', notice: @onboardings_objective.finished_message
    else
      @onboardings_step = @onboardings_objective.steps.find(params[:id])
      @current_step_id = @onboardings_step.id
    end
    
  end
end