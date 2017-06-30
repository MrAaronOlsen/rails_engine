require 'rails_helper'

describe 'Item business logic' do

  it 'returns the top x items ranked by total revenue generated' do
    item = create_list(:invoice, 10, :with_invoice_items).first.invoice_items.first.item

    get ('/api/v1/items/most_revenue?quantity=2')
    expect(response).to be_success

    top_items = JSON.parse(response.body)

    expect(top_items.count).to eq(2)
    expect(top_items[0]['id']).to eq(item.id + 1)
    expect(top_items[1]['id']).to eq(item.id)
  end

  it 'returns the top x item instances ranked by total number sold' do
    item = create_list(:invoice, 10, :with_invoice_items).first.invoice_items.first.item

    get ('/api/v1/items/most_items?quantity=2')

    expect(response).to be_success

    top_items = JSON.parse(response.body)

    expect(top_items.count).to eq(2)
    expect(top_items[0]['id']).to eq(item.id + 1)
    expect(top_items[1]['id']).to eq(item.id)
  end

  it 'returns the date with the most sales for the given item using the invoice date' do
    item = create(:item, :with_invoices)

    get ("/api/v1/items/#{item.id}/best_day")
    expect(response).to be_success

    date = JSON.parse(response.body)

    expect(date).to eq("best_day"=>"2000-03-27T14:54:12.000Z")
  end
end
