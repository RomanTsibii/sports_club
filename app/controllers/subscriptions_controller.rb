class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def update
    @subscription = Subscription.find(params[:id])
    if @subscription.update(subscription_params)
      flash[:notice] = "Saved..."
      redirect_to subscriptions_path
    else
      flash[:alert] = "Не може зберегти"
      render edit_subscription_path
    end
  end


  def delete
    @subscription = Subscription.find(params[:id])
    @subscription.delete
    redirect_to subscriptions_path, :notice => "Абонемент видалено"

  end

  private

  def subscription_params
    params.require(:subscription).permit(:name, :number_of_lessons, :validity, :price )
  end
end
