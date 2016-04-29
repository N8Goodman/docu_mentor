class AppsController < ApplicationController
  def index
    @app = App.new
    @procedure_selects = Procedure.all
  end

  def show
    @app = App.find(params[:id])
    @steps = @app.steps
    @uploads = @app.uploads
  end

  def create
    @app = App.new(app_params)
    @app.user = current_user
    if @app.save
      make_steps(@app)
      make_uploads(@app)
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

  def make_steps(app)
    app.procedure.stages.each do |stage|
      Step.create(user: current_user, stage: stage, app: app, order: stage.this_level(app.procedure).order)
    end
  end

  def make_uploads(app)
    app.steps.each do |step|
      step.stage.documents.each do |doc|
        Upload.create(user: current_user, app: app, step: step, document: doc)
      end
    end
  end
end
