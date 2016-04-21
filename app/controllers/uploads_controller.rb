class UploadsController < ApplicationController
  def update
    @upload = Upload.find(params[:id])
    if !params[:upload].nil?
      @upload.update(upload_params)
    end
    if @upload.save
      check_upload(@upload)
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

  def check_upload(upload)
    if upload.document_file.nil?
      upload.accepted = false
      upload.flagged = true
    else
      upload.flagged = false
      upload.accepted = true
    end
    upload.save
  end
end
