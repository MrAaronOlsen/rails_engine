require 'rails_helper'

describe 'Merchant business logic' do

  context 'user wants list of merchants' do
    before do
      @merchants = 20.times.map do |i|
        create(:merchant, :with_invoices, invoice_count: i)
      end
    end

    it 'returns the top x merchants ranked by total revenue' do
      get ('/api/v1/merchants/most_revenue?quantity=5')
      expect(response).to be_success

      merchants = JSON.parse(response.body)

      expect_merchants = @merchants.reverse[0..4]

      expect(merchants.count).to eq(5)
      merchants.each_with_index do |merchant, i|
        expect(merchant['id']).to eq(expect_merchants[i])
      end
    end

    xit 'returns the top x merchants ranked by total number of items sold' do

    end

    xit 'returns the total revenue for date x across all merchants' do

    end
  end
end