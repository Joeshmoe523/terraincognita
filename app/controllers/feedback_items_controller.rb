class FeedbackItemsController < ApplicationController
  def create
    @feedback_item = current_user.feedback_items.build(feedback_item_params)

    if @feedback_item.save
      if @feedback_item.growth_plan.present?
        redirect_to growth_plan_path(@feedback_item.growth_plan.token), notice: "Feedback item was successfully created."
      else
        redirect_to dashboard_path, notice: "Feedback item was successfully created."
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @feedback_item = FeedbackItem.find_by_token!(params[:token])
  end

  def edit
    @feedback_item = FeedbackItem.find_by_token!(params[:token])
  end

  def update
    @feedback_item = FeedbackItem.find_by_token!(params[:token])

    if @feedback_item.update(feedback_item_params)
      redirect_to feedback_item_path(@feedback_item.token), notice: "Feedback item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def feedback_item_params
    params.require(:feedback_item).permit(:feedback_type, :provider_name, :content, :reflections, :growth_plan_id, :user_id, :situation, :behavior, :impact)
  end
end
