class AppsController < ApplicationController
  def index
    @app = App.new
    @procedure_selects = Procedure.all
  end

  def show
    @app = App.find(params[:id])
  end

  def create
    @app = App.new(app_params)
    @app.user = current_user
    if @app.save
      flash[:notice] = "Application started!"
      redirect_to app_path(@app)
    else
      flash[:error] = @app.errors.full_messages.join", "
      redirect_to apps_path
    end
  end

  private

  def app_params
    params.require(:app).permit(
      :procedure_id
    )
  end
end
