require 'rails_helper'

describe 'Customers API' do

  context 'user wants to get customer' do
    it 'gets list of all customers' do
      create_list(:customer, 3)

      get '/api/v1/customers'
      expect(response).to be_success
      raw_customers = JSON.parse(response.body)

      expect(raw_customers.count).to eq(3)
      expect(raw_customers.first).to have_key('first_name')
      expect(raw_customers.first).to have_key('last_name')
      expect(raw_customers.first).not_to have_key('created_at')
      expect(raw_customers.first).not_to have_key('updated_at')
    end

    it 'gets a customer' do
      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}"
      expect(response).to be_success
      raw_customer = JSON.parse(response.body)

      expect(raw_customer['first_name']).to eq(customer.first_name)
      expect(raw_customer['last_name']).to eq(customer.last_name)
    end
  end

  context 'user wants to find a customer' do
    before do
      @customer = create_list(:customer, 10).first
    end

    it 'finds customer by id' do
      get "/api/v1/customers/find?id=#{@customer.id}"
      expect(response).to be_success
      found_customer = JSON.parse(response.body)

      expect(@customer.id).to eq(found_customer['id'])
      expect(@customer.first_name).to eq(found_customer['first_name'])
    end

    it 'finds customer by first_name' do
      get "/api/v1/customers/find?first_name=#{@customer.first_name}"
      expect(response).to be_success
      found_customer = JSON.parse(response.body)

      expect(@customer.id).to eq(found_customer['id'])
      expect(@customer.first_name).to eq(found_customer['first_name'])
    end

    it 'finds customer by last_name' do
      customer = create(:customer, last_name: 'Artax')

      get "/api/v1/customers/find?last_name=#{customer.last_name}"
      expect(response).to be_success
      found_customer = JSON.parse(response.body)

      expect(customer.id).to eq(found_customer['id'])
      expect(customer.last_name).to eq(found_customer['last_name'])
    end

    it 'finds customer by created_at' do

      get "/api/v1/customers/find?created_at=#{@customer.created_at}"
      expect(response).to be_success
      found_customer = JSON.parse(response.body)

      expect(@customer.id).to eq(found_customer['id'])
      expect(@customer.last_name).to eq(found_customer['last_name'])
    end

    it 'finds customer by updated_at' do

      get "/api/v1/customers/find?updated_at=#{@customer.updated_at}"
      expect(response).to be_success
      found_customer = JSON.parse(response.body)

      expect(@customer.id).to eq(found_customer['id'])
      expect(@customer.last_name).to eq(found_customer['last_name'])
    end
  end

  context 'user wants to find customers' do
    before do
      @customers = create_list(:customer, 10)
    end

    it 'finds all customers by id' do
      customers = create_list(:customer, 1)

      get "/api/v1/customers/find_all?id=#{customers.first.id}"
      expect(response).to be_success
      found_customers = JSON.parse(response.body)

      expect(found_customers.count).to eq(1)

      found_customers.each_with_index do |found_customer, i|
        expect(found_customer['id']).to eq(customers[i].id)
      end
    end

    it 'finds all customers by first_name' do
      get "/api/v1/customers/find_all?first_name=#{@customers.first.first_name}"
      expect(response).to be_success
      found_customers = JSON.parse(response.body)

      expect(found_customers.count).to eq(10)

      found_customers.each_with_index do |found_customer, i|
        expect(found_customer['id']).to eq(@customers[i].id)
      end
    end

    it 'finds all customers by last_name' do
      get "/api/v1/customers/find_all?last_name=#{@customers.first.last_name}"
      expect(response).to be_success
      found_customers = JSON.parse(response.body)

      expect(found_customers.count).to eq(10)

      found_customers.each_with_index do |found_customer, i|
        expect(found_customer['id']).to eq(@customers[i].id)
      end
    end
  end
end