class ProgressUpdatesController < ApplicationController
  def create
    @progress_update = current_user.progress_updates.build(progress_update_params)

    if @progress_update.save
      if @progress_update.growth_plan.present?
        redirect_to timeline_growth_plan_path(@progress_update.growth_plan.token), notice: "Progress update was successfully created."
      else
        redirect_to dashboard_path, notice: "Progress update was successfully created."
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @progress_update = ProgressUpdate.find_by_token!(params[:token])
  end

  def edit
    @progress_update = ProgressUpdate.find_by_token!(params[:token])
  end

  def update
    @progress_update = ProgressUpdate.find_by_token!(params[:token])

    if @progress_update.update(progress_update_params)
      redirect_to progress_update_path(@progress_update.token), notice: "Progress update was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @progress_update = ProgressUpdate.new
    @growth_plans = current_user.growth_plans
  end

  private

  def progress_update_params
    params.require(:progress_update).permit(:actions, :extractions, :growth_plan_id, :user_id)
  end
end
