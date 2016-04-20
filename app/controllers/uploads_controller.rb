class UploadsController < ApplicationController

  def update
    @upload = Upload.find(params[:id])
    @upload.update(upload_params)
    if @upload.save
      flash[:notice] = "File added!"
    else
      flash[:error] = @upload.errors.full_messages.join", "
    end
    redirect_to app_path(@upload.app)
  end

  private

  def upload_params
    params.require(:upload).permit(:document_file)
  end
end
