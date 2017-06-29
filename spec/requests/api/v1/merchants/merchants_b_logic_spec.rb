require 'rails_helper'

describe 'Merchant business logic' do

  context 'user wants list of merchants' do
    before do
      #this is gross
      @merchants = create_list(:merchant, 5, :with_invoices)[0..2]
      invoice_items = @merchants.map do |merch|
        merch.invoices.map { |inv| inv.invoice_items }
      end

      invoice_items.flatten.each_with_index { |inv_it, i| inv_it.quantity += i }
    end

    it 'returns the top x merchants ranked by total revenue' do
      get ('/api/v1/merchants/most_revenue?quantity=3')
      expect(response).to be_success

      merchant_ids = JSON.parse(response.body).map { |merch| merch['id'] }

      expect(merchant_ids.count).to eq(3)
      expect(merchant_ids).to include(@merchants[0].id, @merchants[1].id, @merchants[2].id)
    end

    it 'returns the top x merchants ranked by total number of items sold' do
      get ('/api/v1/merchants/most_items?quantity=3')
      expect(response).to be_success

      merchant_ids = JSON.parse(response.body).map { |merch| merch['id'] }

      expect(merchant_ids.count).to eq(3)
      expect(merchant_ids).to include(@merchants[0].id, @merchants[1].id, @merchants[2].id)
    end

    it 'returns the total revenue for date x across all merchants' do
      get ('/api/v1/merchants/revenue?date=2067-03-27 14:54:12 UTC')
      expect(response).to be_success

      revenue = JSON.parse(response.body)
      expect(revenue).to eq("total_revenue" => "13.5")
    end
  end

  context 'user wants a merchant' do
    before do
      @merchant = create_list(:merchant, 5, :with_invoices).first
    end

    it 'returns the total revenue for that merchant across all transactions' do
      get ("/api/v1/merchants/#{@merchant.id}/revenue")
      expect(response).to be_success

      revenue = JSON.parse(response.body)
      expect(revenue).to eq("revenue" => "2.7")
    end

    it 'returns the total revenue for that merchant for a specific invoice date' do
      date = @merchant.invoices.first.created_at

      get ("/api/v1/merchants/#{@merchant.id}/revenue?date=#{date}")
      expect(response).to be_success

      revenue = JSON.parse(response.body)
      expect(revenue).to eq("revenue" => "2.7")
    end

    it 'returns the customer who has conducted the most total number of successful transactions.' do
      customer = create(:customer, first_name: 'Whoditty')
      create_list( :invoice, 30, :with_transactions,
                   customer: customer, merchant: @merchant )

      get ("/api/v1/merchants/#{@merchant.id}/favorite_customer")
      expect(response).to be_success

      customer = JSON.parse(response.body)
      expect(customer['first_name']).to eq( "Whoditty" )
    end

    it 'returns a collection of customers which have pending (unpaid) invoices.' do
      bad_customers = [ create(:customer, first_name: 'Whoditty'),
                        create(:customer, first_name: 'Blamfitty') ]

      create( :invoice, :with_failed_transactions,
              customer: bad_customers[0], merchant: @merchant )
      create( :invoice, :with_failed_transactions,
              customer: bad_customers[1], merchant: @merchant )

      get ("/api/v1/merchants/#{@merchant.id}/customers_with_pending_invoices")
      expect(response).to be_success

      customers = JSON.parse(response.body).map { |cust| cust['first_name']}
      expect(customers).to include(bad_customers[0].first_name,
                                                bad_customers[1].first_name)
    end
  end
end