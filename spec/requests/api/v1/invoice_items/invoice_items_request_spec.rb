require 'rails_helper'

describe 'Invoice Items API' do

  context 'Basic get requests' do
    it 'sends list of all invoice_items' do
      create_list(:invoice_item, 3)

      get '/api/v1/invoice_items'
      expect(response).to be_success
      raw_invoice_items = JSON.parse(response.body)

      expect(raw_invoice_items.count).to eq(3)
      expect(raw_invoice_items.first).to have_key('item_id')
      expect(raw_invoice_items.first).to have_key('invoice_id')
      expect(raw_invoice_items.first).to have_key('quantity')
      expect(raw_invoice_items.first).to have_key('unit_price')
      expect(raw_invoice_items.first).to have_key('created_at')
      expect(raw_invoice_items.first).to have_key('updated_at')
    end

    it 'shows an invoice_item' do
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
end