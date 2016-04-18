class LevelsController < ApplicationController
  def create
    @procedure = Procedure.find(params[:procedure_id])
    @level = Level.new(level_params)
    @level.procedure = @procedure
    if @level.save
      flash[:notice] = "Stage Added!"
    else
      flash[:error] = @level.errors.full_messages.join", "
    end
    redirect_to procedure_path(@procedure)
  end

  private

  def level_params
    params.require(:level).permit(
      :stage_id
    )
  end
end
