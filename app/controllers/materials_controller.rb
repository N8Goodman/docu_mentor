class MaterialsController < ApplicationController
  def create
    @stage = Stage.find(params[:stage_id])
    @material = Material.new(material_params)
    @material.stage = @stage
    if @material.save
      flash[:notice] = "Stage Added!"
    else
      flash[:error] = @material.errors.full_messages.join", "
    end
    redirect_to stage_path(@stage)
  end

  private

  def material_params
    params.require(:material).permit(
      :document_id
    )
  end
end
