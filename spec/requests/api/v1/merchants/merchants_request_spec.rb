require 'rails_helper'

describe 'Merchants API' do

  context 'Basic get requests' do
    it 'sends list of all merchants' do
      create_list(:merchant, 3)

      get '/api/v1/merchants'
      expect(response).to be_success
      raw_merchants = JSON.parse(response.body)

      expect(raw_merchants.count).to eq(3)
      expect(raw_merchants.first).to have_key('name')
      expect(raw_merchants.first).to have_key('created_at')
      expect(raw_merchants.first).to have_key('updated_at')
    end

    it 'shows a merchant' do
      merchant = create(:merchant)

      get "/api/v1/merchants/#{merchant.id}"
      expect(response).to be_success
      raw_merchant = JSON.parse(response.body)

      expect(raw_merchant['name']).to eq(merchant.name)
    end
  end
end