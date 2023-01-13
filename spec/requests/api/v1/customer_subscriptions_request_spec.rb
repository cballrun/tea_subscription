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

    it 'can add a customer subscription' do
      customer = create(:customer)
      subscriptions = create_list(:subscription, 3)

      sub_params = ({customer_id: customer.id,
                    subscription_id: subscriptions[1].id,
                    })

      expect(customer.subscriptions.count).to eq(0)

      post '/api/v1/customer_subscriptions', params: sub_params

      expect(response).to be_successful
      expect(customer.subscriptions.count).to eq(1)

      cs_data = JSON.parse(response.body, symbolize_names: true)
      cs = cs_data[:data]
      
      expect(cs[:id].to_i).to be_a(Integer)
      expect(cs[:type]).to eq("customer_subscription")
      expect(cs[:attributes][:customer_id]).to eq(customer.id)
      expect(cs[:attributes][:subscription_id]).to eq(subscriptions[1].id)
      expect(cs[:attributes][:status]).to eq("active")
    end

    it 'can cancel a customers subscription' do
      customer = create(:customer)
      subscriptions = create_list(:subscription, 3)
      cs_1 = CustomerSubscription.create!(customer: customer, subscription: subscriptions[0], status: "active")
      cs_2 = CustomerSubscription.create!(customer: customer, subscription: subscriptions[1], status: "active")
      cs_3 = CustomerSubscription.create!(customer: customer, subscription: subscriptions[2], status: "cancelled")

      sub_params = ({
        status: "cancelled"
        })

      patch "/api/v1/customer_subscriptions/#{cs_1.id}", params: sub_params
      
      expect(response).to be_successful

      cs_data = JSON.parse(response.body, symbolize_names: true)
      cs = cs_data[:data]

      expect(cs[:id].to_i).to be_a(Integer)
      expect(cs[:type]).to eq("customer_subscription")
      expect(cs[:attributes][:customer_id]).to eq(customer.id)
      expect(cs[:attributes][:subscription_id]).to eq(subscriptions[0].id)
      expect(cs[:attributes][:status]).to eq("cancelled")
    end
  end
end