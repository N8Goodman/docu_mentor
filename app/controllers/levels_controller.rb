class LevelsController < AdminController
  def create
    @procedure = Procedure.find(params[:procedure_id])
    @level = Level.new(level_params)
    @level.procedure = @procedure
    @order = Level.where(procedure: @procedure)
    @level.order = @order.length + 1
    if @level.save
      flash[:notice] = "Stage Added!"
    else
      flash[:error] = @level.errors.full_messages.join", "
    end
    redirect_to procedure_path(@procedure)
  end

  def update
    @procedure = Procedure.find(params[:procedure_id])
    @order = params[:stages]
    i = 0
    @order.length.times do
      stage = Stage.find(@order[i])
      level = stage.this_level(@procedure)
      level.update(order: (i + 1))
      level.save
      i += 1
    end
  end

  def destroy
    @level = Level.find(params[:id])
    if @level.destroy!
      flash[:notice] = "#{@level.stage.stage_name} has been removed from stage!"
    else
      flash[:error] = @level.errors.full_messages.join", "
    end
    redirect_to procedure_path(@level.procedure)
  end

  private

  def level_params
    params.require(:level).permit(
      :stage_id
    )
  end
end
