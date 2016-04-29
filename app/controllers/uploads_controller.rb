class UploadsController < ApplicationController
  def update
    binding.pry
    @upload = Upload.find(params[:id])
    @upload.update(document_file: params[:file].tempfile)
    if @upload.save
      check_upload(@upload)
      flash[:notice] = "File added!"
    else
      flash[:error] = @upload.errors.full_messages.join", "
    end
    render json: @upload
  end

  private

  def upload_params
    params.require(:upload).permit(:document_file)
  end

  def check_upload(upload)
    if upload.document_file.nil?
      upload.accepted = false
      upload.flagged = true
      blank = Icon.find_by(name: 'blank')
      upload(icon: blank)
    else
      set_icon(upload)
      upload.flagged = false
      upload.accepted = true
    end
    upload.save
  end

  def set_icon(document)
    @type = document.document_file.filename.split(".")
    @ext = @type[-1]
    if @ext.include?("doc")
      @doc_icon = Icon.find_by(name: 'doc')
      document.icon = @doc_icon
    elsif @ext.include?("jpg") || @ext.include?("jpeg")
      @jpg_icon = Icon.find_by(name: 'jpeg')
      document.icon = @jpg_icon
    elsif @ext.include?("pdf")
      @pdf_icon = Icon.find_by(name: 'pdf')
      document.icon = @pdf_icon
    elsif @ext.include?("png")
      @png_icon = Icon.find_by(name: 'png')
      document.icon = @png_icon
    elsif @ext.include?("zip")
      @zip_icon = Icon.find_by(name: 'zip')
      document.icon = @zip_icon
    elsif @ext.include?("xls")
      @xl_icon = Icon.find_by(name: 'excel')
      document.icon = @xl_icon
    elsif @ext.include?("ppt")
      @ppt_icon = Icon.find_by(name: 'ppt')
      document.icon = @ppt_icon
    else
      @unknown_icon = Icon.find_by(name: 'unknown')
      document.icon = @unknown_icon
    end
  end
end
