class StepsController < ApplicationController

  def update
    @step = Step.find(params[:id])
    @app = @step.app
    if params[:step][:ready_for_review] == '1'
    @step.update(accepted: true)
      if @step.save
        @app.update(active_stage: (@step.order + 1) )
        @app.completed?
        @app.save
        flash[:notice] = "Step Completed"
      else
        @step.errors.full_messages.join" ,"
      end
    end
    redirect_to app_path(@step.app)
  end

end
