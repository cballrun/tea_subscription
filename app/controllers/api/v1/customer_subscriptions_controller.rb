class Api::V1::CustomerSubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def create
    customer = Customer.find(params[:customer_id])
    subscription = Subscription.find(params[:subscription_id])
    cs = CustomerSubscription.create!(customer: customer, subscription: subscription, status: "active")
    render json: CustomerSubscriptionSerializer.new(cs)
  end

  def update
    
  end
end