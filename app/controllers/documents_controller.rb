class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      flash[:notice] = "Document created!"
      redirect_to document_path(@document)
    else
      flash[:error] = @document.errors.full_messages.join", "
      render 'new'
    end
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    @document.update(document_params)
    if @document.save
      flash[:notice] = "Document updated!"
      redirect_to document_path(@document)
    else
      flash[:error] = @document.errors.full_messages.join", "
      render 'edit'
    end
  end

  def destroy
    @document = Document.find(params[:id])
    if @document.destroy!
      flash[:notice] = "#{@document.document_name} has been deleted!"
      redirect_to documents_path
    else
      flash[:error] = @document.errors.full_messages.join", "
      redirect_to document_path(@document)
    end
  end

  private

  def document_params
    params.require(:document).permit(
      :document_name,
      :description,
      :completion_status
    )
  end
end
