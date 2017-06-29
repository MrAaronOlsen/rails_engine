require 'rails_helper'

describe 'Invoice Items API' do

  context 'user wants to get invoice_items' do
    it 'gets list of all invoice_items' do
      create_list(:invoice_item, 3)

      get '/api/v1/invoice_items'
      expect(response).to be_success
      raw_invoice_items = JSON.parse(response.body)

      expect(raw_invoice_items.count).to eq(3)
      expect(raw_invoice_items.first).to have_key('item_id')
      expect(raw_invoice_items.first).to have_key('invoice_id')
      expect(raw_invoice_items.first).to have_key('quantity')
      expect(raw_invoice_items.first).to have_key('unit_price')
      expect(raw_invoice_items.first).not_to have_key('created_at')
      expect(raw_invoice_items.first).not_to have_key('updated_at')
    end

    it 'gets an invoice_item' do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/#{invoice_item.id}"
      expect(response).to be_success
      raw_invoice_item = JSON.parse(response.body)

      expect(raw_invoice_item['item_id']).to eq(invoice_item.item_id)
      expect(raw_invoice_item['invoice_id']).to eq(invoice_item.invoice_id)
      expect(raw_invoice_item['quantity']).to eq(invoice_item.quantity)
      expect(raw_invoice_item['unit_price']).to eq(invoice_item.unit_price.to_s)
    end
  end

  context 'user wants to find an invoice_item' do
    before do
      @invoice_item = create_list(:invoice_item, 10).first
    end

    it 'finds invoice_item by id' do
      get "/api/v1/invoice_items/find?id=#{@invoice_item.id}"
      expect(response).to be_success
      found_invoice_item = JSON.parse(response.body)

      expect(@invoice_item.id).to eq(found_invoice_item['id'])
    end

    it 'finds invoice_item by quantity' do
      get "/api/v1/invoice_items/find?quantity=#{@invoice_item.quantity}"
      expect(response).to be_success
      found_invoice_item = JSON.parse(response.body)

      expect(@invoice_item.id).to eq(found_invoice_item['id'])
      expect(@invoice_item.quantity).to eq(found_invoice_item['quantity'])
    end

    it 'finds invoice_item by unit_price' do
      get "/api/v1/invoice_items/find?unit_price=#{@invoice_item.unit_price}"
      expect(response).to be_success
      found_invoice_item = JSON.parse(response.body)

      expect(@invoice_item.id).to eq(found_invoice_item['id'])
    end

    it 'finds invoice_item by item_id' do
      get "/api/v1/invoice_items/find?item_id=#{@invoice_item.item_id}"
      expect(response).to be_success
      found_invoice_item = JSON.parse(response.body)

      expect(@invoice_item.id).to eq(found_invoice_item['id'])
    end

    it 'finds invoice_item by invoice_id' do
      get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item.invoice_id}"
      expect(response).to be_success
      found_invoice_item = JSON.parse(response.body)

      expect(@invoice_item.id).to eq(found_invoice_item['id'])
    end

    it 'finds invoice_item by created_at' do
      get "/api/v1/invoice_items/find?created_at=#{@invoice_item.created_at}"
      expect(response).to be_success
      found_invoice_item = JSON.parse(response.body)

      expect(@invoice_item.id).to eq(found_invoice_item['id'])
    end

    it 'finds invoice_item by updated_at' do
      get "/api/v1/invoice_items/find?updated_at=#{@invoice_item.updated_at}"
      expect(response).to be_success
      found_invoice_item = JSON.parse(response.body)

      expect(@invoice_item.id).to eq(found_invoice_item['id'])
    end
  end

  context 'user wants to find invoice_items' do
    before do
      @invoice_items = create_list(:invoice_item, 10)
    end

    it 'finds all invoice_items by id' do
      invoice_items = create_list(:invoice_item, 1)

      get "/api/v1/invoice_items/find_all?id=#{invoice_items.first.id}"
      expect(response).to be_success
      found_invoice_items = JSON.parse(response.body)

      expect(found_invoice_items.count).to eq(1)

      found_invoice_items.each_with_index do |found_invoice_item, i|
        expect(found_invoice_item['id']).to eq(invoice_items[i].id)
      end
    end

    it 'finds all invoice_items by quantity' do
      invoice_items = create_list(:invoice_item, 10, quantity: 134)

      get "/api/v1/invoice_items/find_all?quantity=#{invoice_items.first.quantity}"
      expect(response).to be_success
      found_invoice_items = JSON.parse(response.body)

      expect(found_invoice_items.count).to eq(10)

      found_invoice_items.each_with_index do |found_invoice_item, i|
        expect(found_invoice_item['id']).to eq(invoice_items[i].id)
      end
    end

    it 'finds all invoice_items by unit_price' do
      get "/api/v1/invoice_items/find_all?unit_price=#{@invoice_items.first.unit_price}"
      expect(response).to be_success
      found_invoice_items = JSON.parse(response.body)

      expect(found_invoice_items.count).to eq(10)

      found_invoice_items.each_with_index do |found_invoice_item, i|
        expect(found_invoice_item['id']).to eq(@invoice_items[i].id)
      end
    end

    it 'finds all invoice_items by item_id' do
      item = create(:item)
      @invoice_items = create_list(:invoice_item, 10, item: item)

      get "/api/v1/invoice_items/find_all?item_id=#{item.id}"
      expect(response).to be_success
      found_invoice_items = JSON.parse(response.body)

      expect(found_invoice_items.count).to eq(10)

      found_invoice_items.each_with_index do |found_invoice_item, i|
        expect(found_invoice_item['id']).to eq(@invoice_items[i].id)
      end
    end

    it 'finds all invoice_items by invoice_id' do
      invoice = create(:invoice)
      @invoice_items = create_list(:invoice_item, 10, invoice: invoice)

      get "/api/v1/invoice_items/find_all?invoice_id=#{invoice.id}"
      expect(response).to be_success
      found_invoice_items = JSON.parse(response.body)

      expect(found_invoice_items.count).to eq(10)

      found_invoice_items.each_with_index do |found_invoice_item, i|
        expect(found_invoice_item['id']).to eq(@invoice_items[i].id)
      end
    end
  end
end