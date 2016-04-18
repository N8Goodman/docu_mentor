class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def show
    @material = Material.new
    @document_selects = Document.all
    @stage = Stage.find(params[:id])
    @documents = @stage.documents
  end

  def new
    @stage = Stage.new
  end

  def create
    @stage = Stage.new(stage_params)
    if @stage.save
      flash[:notice] = "Stage created!"
      redirect_to stage_path(@stage)
    else
      flash[:error] = @stage.errors.full_messages.join", "
      render 'new'
    end
  end

  def edit
    @stage = Stage.find(params[:id])
  end

  def update
    @stage = Stage.find(params[:id])
    @stage.update(stage_params)
    if @stage.save
      flash[:notice] = "Stage updated!"
      redirect_to stage_path(@stage)
    else
      flash[:error] = @stage.errors.full_messages.join", "
      render 'edit'
    end
  end

  def destroy
    @stage = Stage.find(params[:id])
    if @stage.destroy!
      flash[:notice] = "#{@stage.stage_name} has been deleted!"
      redirect_to stages_path
    else
      flash[:error] = @stage.errors.full_messages.join", "
      redirect_to stage_path(@stage)
    end
  end

  private

  def stage_params
    params.require(:stage).permit(
      :stage_name,
      :description,
      :completion_status
    )
  end
end
