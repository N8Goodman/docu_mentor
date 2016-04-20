class OrdersController < ApplicationController

  def upmove
    @level = Level.find(params[:level_id])
    @procedure = @level.procedure
    @current_order = @level.order
    @level.update(order: 0)
    @level.save
    if @current_order != 1
      @switch = Level.where(procedure: @procedure).find_by(order: (@current_order - 1))
      @switch.update(order: @current_order)
      @switch.save
      @level.update(order: (@current_order - 1))
      @level.save
      flash[:notice] = "Order changed!"
    else
      flash[:error] = "This is already the first stage!"
      @level.update(order: @current_order)
      @level.save
    end
    redirect_to procedure_path(@procedure)
  end

  def downmove
    @level = Level.find(params[:level_id])
    @procedure = @level.procedure
    @levels = @procedure.levels.length
    @current_order = @level.order
    @level.update(order: 0)
    @level.save
    if @current_order != @levels
      @switch = Level.where(procedure: @procedure).find_by(order: (@current_order + 1))
      @switch.update(order: @current_order)
      @switch.save
      @level.update(order: (@current_order + 1))
      @level.save
      flash[:notice] = "Order changed!"
    else
      flash[:error] = "This is already the last stage!"
      @level.update(order: @current_order)
      @level.save
    end
    redirect_to procedure_path(@procedure)
  end
end
