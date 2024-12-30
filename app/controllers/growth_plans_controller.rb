class GrowthPlansController < ApplicationController
  def index
    @growth_plans = current_user.growth_plans
  end
  def new
    @growth_plan = GrowthPlan.new
  end

  def show
    @growth_plan = GrowthPlan.find_by_token!(params[:token])
    @growth_plans = current_user.growth_plans
    @feedback_item = @growth_plan.feedback_items.new
    @progress_update = @growth_plan.progress_updates.new
  end
  def edit
    @growth_plan = GrowthPlan.find_by_token!(params[:token])
  end

  def timeline
    @growth_plan = GrowthPlan.find_by_token!(params[:token])
    @growth_plans = current_user.growth_plans
    @feedback_item = @growth_plan.feedback_items.new
    @progress_update = @growth_plan.progress_updates.new
  end

  def collaborators
    @growth_plan = GrowthPlan.find_by_token!(params[:token])
  end

  def create
    @growth_plan = current_user.growth_plans.build(growth_plan_params)

    if @growth_plan.save
      redirect_to growth_plan_path(@growth_plan.token), notice: "Growth plan was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @growth_plan = GrowthPlan.find_by_token!(params[:id])
    if @growth_plan.update(growth_plan_params)
      redirect_to growth_plan_path(@growth_plan.token), notice: "Growth plan was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @growth_plan = GrowthPlan.find_by_token!(params[:id])
    @growth_plan.destroy
    redirect_to growth_plans_path, notice: "Growth plan was successfully deleted."
  end

  private
  def set_growth_plan
    @growth_plan = GrowthPlan.find_by_token!(params[:id])
  end

  def growth_plan_params
    params.require(:growth_plan).permit(:title, :description, :status, :start_date, :end_date)
  end
end
