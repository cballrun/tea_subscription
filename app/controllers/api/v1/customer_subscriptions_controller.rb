class Api::V1::CustomerSubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions), status: 200
  end

  def create
    customer = Customer.find(params[:customer_id])
    subscription = Subscription.find(params[:subscription_id])
    cs = CustomerSubscription.create!(customer: customer, subscription: subscription, status: "active")
    render json: CustomerSubscriptionSerializer.new(cs), status: 201
  end

  def update
    cs = CustomerSubscription.find(params[:id])
    cs.update!(customer_subscription_params)
    render json: CustomerSubscriptionSerializer.new(cs), status: 200
  end

  private

  def customer_subscription_params
    params.permit(:status)
  end
end