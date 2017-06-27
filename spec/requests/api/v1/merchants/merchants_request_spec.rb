require 'rails_helper'

describe 'Merchants API' do

  context 'user wants to get merchants' do
    it 'gets list of all merchants' do
      create_list(:merchant, 3)

      get '/api/v1/merchants'
      expect(response).to be_success
      raw_merchants = JSON.parse(response.body)

      expect(raw_merchants.count).to eq(3)
      expect(raw_merchants.first).to have_key('name')
    end

    it 'gets a merchant' do
      merchant = create(:merchant)

      get "/api/v1/merchants/#{merchant.id}"
      expect(response).to be_success
      raw_merchant = JSON.parse(response.body)

      expect(raw_merchant['name']).to eq(merchant.name)
    end
  end

  context 'user wants to find a merchant' do
    before do
      @merchant = create_list(:merchant, 10).first
    end

    it 'finds merchant by id' do
      get "/api/v1/merchants/find?id=#{@merchant.id}"
      expect(response).to be_success
      found_merchant = JSON.parse(response.body)

      expect(@merchant.id).to eq(found_merchant['id'])
      expect(@merchant.name).to eq(found_merchant['name'])
    end

    it 'finds merchant by name' do
      get "/api/v1/merchants/find?name=#{@merchant.name}"
      expect(response).to be_success
      found_merchant = JSON.parse(response.body)

      expect(@merchant.id).to eq(found_merchant['id'])
      expect(@merchant.name).to eq(found_merchant['name'])
    end

    it 'finds merchant by created_at' do

      get "/api/v1/merchants/find?created_at=#{@merchant.created_at}"
      expect(response).to be_success
      found_merchant = JSON.parse(response.body)

      expect(@merchant.id).to eq(found_merchant['id'])
      expect(@merchant.name).to eq(found_merchant['name'])
    end

    it 'finds merchant by updated_at' do

      get "/api/v1/merchants/find?updated_at=#{@merchant.updated_at}"
      expect(response).to be_success
      found_merchant = JSON.parse(response.body)

      expect(@merchant.id).to eq(found_merchant['id'])
      expect(@merchant.name).to eq(found_merchant['name'])
    end
  end

  context 'user wants to find merchants' do
    before do
      @merchants = create_list(:merchant, 10)
    end

    it 'finds all merchants by id' do
      merchants = create_list(:merchant, 1)

      get "/api/v1/merchants/find_all?id=#{merchants.first.id}"
      expect(response).to be_success
      found_merchants = JSON.parse(response.body)

      expect(found_merchants.count).to eq(1)

      found_merchants.each_with_index do |found_merchant, i|
        expect(found_merchant['id']).to eq(merchants[i].id)
      end
    end

    it 'finds all merchants by name' do
      get "/api/v1/merchants/find_all?name=#{@merchants.first.name}"
      expect(response).to be_success
      found_merchants = JSON.parse(response.body)

      expect(found_merchants.count).to eq(10)

      found_merchants.each_with_index do |found_merchant, i|
        expect(found_merchant['id']).to eq(@merchants[i].id)
      end
    end
  end
end