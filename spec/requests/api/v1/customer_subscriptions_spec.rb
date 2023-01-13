require 'rails_helper'

describe "Customer Subscriptions API" do
  it 'can get all of a customers subscriptions' do
    customer = create(:customer)
    subscription = create(:subscription)
    cs = CustomerSubscription.create!(customer: customer, subscription: subscription, status: "active")
    binding.pry
    expect(cs.status).to eq("active")
  end

  it 'can subscribe a customer to a subscription' do

  end

  it 'can unsubscribe a customers subscription' do
    
  end
end