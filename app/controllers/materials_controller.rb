class MaterialsController < AdminController
  def create
    @stage = Stage.find(params[:stage_id])
    @material = Material.new(material_params)
    @material.stage = @stage
    if @material.save
      flash[:notice] = "Document Added!"
    else
      flash[:error] = @material.errors.full_messages.join", "
    end
    redirect_to stage_path(@stage)
  end

  def destroy
    @material = Material.find(params[:id])
    if @material.destroy!
      flash[:notice] = "#{@material.document.document_name} has been removed from stage!"
    else
      flash[:error] = @material.errors.full_messages.join", "
    end
    redirect_to stage_path(@material.stage)
  end

  private

  def material_params
    params.require(:material).permit(
      :document_id
    )
  end
end
