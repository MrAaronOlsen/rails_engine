require 'rails_helper'

describe 'Items API' do

  context 'Basic get requests' do
    it 'sends list of all items' do
      create_list(:item, 3)

      get '/api/v1/items'
      expect(response).to be_success
      raw_items = JSON.parse(response.body)

      expect(raw_items.count).to eq(3)
      expect(raw_items.first).to have_key('name')
      expect(raw_items.first).to have_key('description')
      expect(raw_items.first).to have_key('unit_price')
      expect(raw_items.first).to have_key('merchant_id')
      expect(raw_items.first).to have_key('created_at')
      expect(raw_items.first).to have_key('updated_at')
    end

    it 'shows an item' do
      item = create(:item)

      get "/api/v1/items/#{item.id}"
      expect(response).to be_success
      raw_item = JSON.parse(response.body)

      expect(raw_item['name']).to eq(item.name)
      expect(raw_item['description']).to eq(item.description)
      expect(raw_item['unit_price']).to eq(item.unit_price.to_s)
      expect(raw_item['merchant_id']).to eq(item.merchant_id)
    end
  end
end