require 'rails_helper'

describe "Customer Subscriptions API" do
  describe 'happy path' do 
    it 'can get all of a customers subscriptions' do
      customer = create(:customer)
      subscriptions = create_list(:subscription, 3)
      cs_1 = CustomerSubscription.create!(customer: customer, subscription: subscriptions[0], status: "active")
      cs_2 = CustomerSubscription.create!(customer: customer, subscription: subscriptions[1], status: "cancelled")
      cs_3 = CustomerSubscription.create!(customer: customer, subscription: subscriptions[2], status: "cancelled")
      
      params = {customer_id: customer.id}
      
      get '/api/v1/customer_subscriptions', params: params

      expect(response).to be_successful

      subscription_data = JSON.parse(response.body, symbolize_names: true)
      subscriptions = subscription_data[:data]

      expect(subscriptions.count).to eq(3)
      
      subscriptions.each do |subscription|
        expect(subscription).to have_key(:id)
        expect(subscription[:id].to_i).to be_a(Integer)

        expect(subscription[:type]).to eq("subscription")

        expect(subscription[:attributes][:title]).to be_a(String)
        expect(subscription[:attributes][:price]).to be_a(Float)
        expect(subscription[:attributes][:frequency]).to be_a(String)
      end
    end

    it 'can subscribe a customer to a subscription' do

    end

    it 'can unsubscribe a customers subscription' do
      
    end
  end
end