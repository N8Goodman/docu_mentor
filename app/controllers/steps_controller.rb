class StepsController < ApplicationController
  def update
    @step = Step.find(params[:id])
    @app = @step.app
    if params[:step][:ready_for_review] == '1' && check_step(@step)
      @step.update(accepted: true)
      if @step.save
        @app.update(active_stage: (@step.order + 1))
        @app.completed?
        @app.save
        flash[:notice] = "Step Completed"
      else
        @step.errors.full_messages.join" ,"
      end
    elsif params[:step][:ready_for_review] == '1'
      flash[:error] = "All uploads must be completed before submission"
    end
    redirect_to app_path(@step.app)
  end

  private

  def check_step(step)
    step.uploads.each do |upload|
      if !upload_accepted(upload)
        return false
      end
    end
    return true
  end

  def upload_accepted(upload)
    if upload.accepted == true
      return true
    else
      return false
    end
  end
end
