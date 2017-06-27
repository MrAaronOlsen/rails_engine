require 'rails_helper'

describe 'Customers API' do

  context 'Basic get requests'
    it 'sends list of all customers' do
      create_list(:customer, 3)

      get '/api/v1/customers'
      expect(response).to be_success
      raw_customers = JSON.parse(response.body)

      expect(raw_customers.count).to eq(3)
      expect(raw_customers.first).to have_key('first_name')
      expect(raw_customers.first).to have_key('last_name')
      expect(raw_customers.first).to have_key('created_at')
      expect(raw_customers.first).to have_key('updated_at')
    end

    it 'shows a customer' do
      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}"
      expect(response).to be_success
      raw_customer = JSON.parse(response.body)

      expect(raw_customers['first_name']).to eq(customer.first_name)
      expect(raw_customers['last_name']).to eq(customer.last_name)
      expect(raw_customers['created_at']).to eq(customer.created_at)
      expect(raw_customers['updated_at']).to eq(customer.updated_at)
    end
  end
end