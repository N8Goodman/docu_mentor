class ProceduresController < ApplicationController
  def index
    @procedures = Procedure.all
  end

  def show
    @procedure = Procedure.find(params[:id])
  end

  def new
    @procedure = Procedure.new
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
      flash[:notice] = "procedure created!"
      redirect_to procedure_path(@procedure)
    else
      flash[:error] = @procedure.errors.full_messages.join", "
      render 'new'
    end
  end

  def edit
    @procedure = Procedure.find(params[:id])
  end

  def update
    @procedure = Procedure.find(params[:id])
    @procedure.update(procedure_params)
    if @procedure.save
      flash[:notice] = "procedure updated!"
    else
      flash[:error] = @procedure.errors.full_messages.join", "
      render 'edit'
    end
  end

  def destroy
  end

  private

  def procedure_params
    params.require(:procedure).permit(
    :name,
    :description,
    :completion_status
    )

  end


end
