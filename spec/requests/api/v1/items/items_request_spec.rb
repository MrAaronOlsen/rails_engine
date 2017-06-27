require 'rails_helper'

describe 'Items API' do

  context 'user wants to get items' do
    it 'gets list of all items' do
      create_list(:item, 3)

      get '/api/v1/items'
      expect(response).to be_success
      raw_items = JSON.parse(response.body)

      expect(raw_items.count).to eq(3)
      expect(raw_items.first).to have_key('name')
      expect(raw_items.first).to have_key('description')
      expect(raw_items.first).to have_key('unit_price')
      expect(raw_items.first).to have_key('merchant_id')
    end

    it 'gets an item' do
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

  context 'user wants to find an item' do
    before do
      @item = create_list(:item, 10).first
    end

    it 'finds item by id' do
      get "/api/v1/items/find?id=#{@item.id}"
      expect(response).to be_success
      found_item = JSON.parse(response.body)

      expect(@item.id).to eq(found_item['id'])
      expect(@item.name).to eq(found_item['name'])
    end

    it 'finds item by name' do
      get "/api/v1/items/find?name=#{@item.name}"
      expect(response).to be_success
      found_item = JSON.parse(response.body)

      expect(@item.id).to eq(found_item['id'])
      expect(@item.name).to eq(found_item['name'])
    end

    it 'finds item by description' do
      get "/api/v1/items/find?description=#{@item.description}"
      expect(response).to be_success
      found_item = JSON.parse(response.body)

      expect(@item.id).to eq(found_item['id'])
      expect(@item.name).to eq(found_item['name'])
    end

    it 'finds item by unit_price' do
      get "/api/v1/items/find?unit_price=#{@item.unit_price}"
      expect(response).to be_success
      found_item = JSON.parse(response.body)

      expect(@item.id).to eq(found_item['id'])
      expect(@item.name).to eq(found_item['name'])
    end

    it 'finds item by created_at' do
      get "/api/v1/items/find?created_at=#{@item.created_at}"
      expect(response).to be_success
      found_item = JSON.parse(response.body)

      expect(@item.id).to eq(found_item['id'])
      expect(@item.name).to eq(found_item['name'])
    end

    it 'finds item by updated_at' do
      get "/api/v1/items/find?updated_at=#{@item.updated_at}"
      expect(response).to be_success
      found_item = JSON.parse(response.body)

      expect(@item.id).to eq(found_item['id'])
      expect(@item.name).to eq(found_item['name'])
    end
  end

  context 'user wants to find items' do
    before do
      @items = create_list(:item, 10)
    end

    it 'finds all items by id' do
      items = create_list(:item, 1)

      get "/api/v1/items/find_all?id=#{items.first.id}"
      expect(response).to be_success
      found_items = JSON.parse(response.body)

      expect(found_items.count).to eq(1)

      found_items.each_with_index do |found_item, i|
        expect(found_item['id']).to eq(items[i].id)
      end
    end

    it 'finds all items by name' do
      get "/api/v1/items/find_all?name=#{@items.first.name}"
      expect(response).to be_success
      found_items = JSON.parse(response.body)

      expect(found_items.count).to eq(10)

      found_items.each_with_index do |found_item, i|
        expect(found_item['id']).to eq(@items[i].id)
      end
    end

    it 'finds all items by description' do
      get "/api/v1/items/find_all?description=#{@items.first.description}"
      expect(response).to be_success
      found_items = JSON.parse(response.body)

      expect(found_items.count).to eq(10)

      found_items.each_with_index do |found_item, i|
        expect(found_item['id']).to eq(@items[i].id)
      end
    end

    it 'finds all items by unit_price' do
      get "/api/v1/items/find_all?unit_price=#{@items.first.unit_price}"
      expect(response).to be_success
      found_items = JSON.parse(response.body)

      expect(found_items.count).to eq(10)

      found_items.each_with_index do |found_item, i|
        expect(found_item['id']).to eq(@items[i].id)
      end
    end
  end
end