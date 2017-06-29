require 'rails_helper'

describe 'Item business logic' do

  it 'returns the top x items ranked by total revenue generated' do
    create_list(:item, 5)
    create_list(:invoice_item, )

    get ('/api/v1/items/most_revenue?quantity=2')
  end

  it 'returns the top x item instances ranked by total number sold' do
    get ('/api/v1/items/most_items?quantity=2')
  end

  it 'returns the date with the most sales for the given item using the invoice date' do
    get ('/api/v1/items/:id/best_day')
  end
