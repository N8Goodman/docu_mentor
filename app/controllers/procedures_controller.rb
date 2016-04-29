class ProceduresController < AdminController
  def index
    @procedures = Procedure.all
  end

  def show
    @level = Level.new
    @stage_selects = Stage.all
    @procedure = Procedure.find(params[:id])
    @stages = @procedure.stages
    @stage_options = @stage_selects - @stages
  end

  def new
    @procedure = Procedure.new
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
      flash[:notice] = "Procedure created!"
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
      flash[:notice] = "Procedure updated!"
      redirect_to procedure_path(@procedure)
    else
      flash[:error] = @procedure.errors.full_messages.join", "
      render 'edit'
    end
  end

  def destroy
    @procedure = Procedure.find(params[:id])
    if @procedure.destroy!
      flash[:notice] = "#{@procedure.procedure_name} has been deleted!"
      redirect_to procedures_path
    else
      flash[:error] = @procedure.errors.full_messages.join", "
      redirect_to procedure_path(@procedure)
    end
  end

  private

  def procedure_params
    params.require(:procedure).permit(
      :procedure_name,
      :description,
      :completion_status
    )
  end
end
