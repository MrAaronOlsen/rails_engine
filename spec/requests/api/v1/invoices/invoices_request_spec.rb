require 'rails_helper'

describe 'Invoices API' do

  context 'user want to get invoices' do
    it 'gets list of all invoices' do
      create_list(:invoice, 3)

      get '/api/v1/invoices'
      expect(response).to be_success
      raw_invoices = JSON.parse(response.body)

      expect(raw_invoices.count).to eq(3)
      expect(raw_invoices.first).to have_key('status')
      expect(raw_invoices.first).to have_key('customer_id')
      expect(raw_invoices.first).to have_key('merchant_id')
      expect(raw_invoices.first).not_to have_key('created_at')
      expect(raw_invoices.first).not_to have_key('updated_at')
    end

    it 'gets an invoice' do
      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}"
      expect(response).to be_success
      raw_invoice = JSON.parse(response.body)

      expect(raw_invoice['customer_id']).to eq(invoice.customer_id)
      expect(raw_invoice['merchant_id']).to eq(invoice.merchant_id)
      expect(raw_invoice['status']).to eq(invoice.status)
    end
  end

  context 'user wants to find an invoice' do
    before do
      @invoice = create_list(:invoice, 10).first
    end

    it 'finds invoice by id' do
      get "/api/v1/invoices/find?id=#{@invoice.id}"
      expect(response).to be_success
      found_invoice = JSON.parse(response.body)

      expect(@invoice.id).to eq(found_invoice['id'])
    end

    it 'finds invoice by status' do
      get "/api/v1/invoices/find?status=#{@invoice.status}"
      expect(response).to be_success
      found_invoice = JSON.parse(response.body)

      expect(@invoice.id).to eq(found_invoice['id'])
    end

    it 'finds invoice by customer_id' do
      get "/api/v1/invoices/find?customer_id=#{@invoice.customer_id}"
      expect(response).to be_success
      found_invoice = JSON.parse(response.body)

      expect(@invoice.id).to eq(found_invoice['id'])
    end

    it 'finds invoice by merchant_id' do
      get "/api/v1/invoices/find?merchant_id=#{@invoice.merchant_id}"
      expect(response).to be_success
      found_invoice = JSON.parse(response.body)

      expect(@invoice.id).to eq(found_invoice['id'])
    end

    it 'finds invoice by created_at' do
      get "/api/v1/invoices/find?created_at=#{@invoice.created_at}"
      expect(response).to be_success
      found_invoice = JSON.parse(response.body)

      expect(@invoice.id).to eq(found_invoice['id'])
    end

    it 'finds invoice by updated_at' do
      get "/api/v1/invoices/find?updated_at=#{@invoice.updated_at}"
      expect(response).to be_success
      found_invoice = JSON.parse(response.body)

      expect(@invoice.id).to eq(found_invoice['id'])
    end
  end

  context 'user wants to find invoices' do
    before do
      @invoices = create_list(:invoice, 10)
    end

    it 'finds all invoices by id' do
      invoices = create_list(:invoice, 1)

      get "/api/v1/invoices/find_all?id=#{invoices.first.id}"
      expect(response).to be_success
      found_invoices = JSON.parse(response.body)

      expect(found_invoices.count).to eq(1)

      found_invoices.each_with_index do |found_invoice, i|
        expect(found_invoice['id']).to eq(invoices[i].id)
      end
    end

    it 'finds all invoices by status' do
      get "/api/v1/invoices/find_all?status=#{@invoices.first.status}"
      expect(response).to be_success
      found_invoices = JSON.parse(response.body)

      expect(found_invoices.count).to eq(10)

      found_invoices.each_with_index do |found_invoice, i|
        expect(found_invoice['id']).to eq(@invoices[i].id)
      end
    end

    it 'finds all invoices by merchant_id' do
      merchant = create(:merchant)
      @invoices = create_list(:invoice, 10, merchant_id: merchant.id)

      get "/api/v1/invoices/find_all?merchant_id=#{@invoices.first.merchant_id}"
      expect(response).to be_success
      found_invoices = JSON.parse(response.body)

      expect(found_invoices.count).to eq(10)

      found_invoices.each_with_index do |found_invoice, i|
        expect(found_invoice['id']).to eq(@invoices[i].id)
      end
    end

    it 'finds all invoices by customer_id' do
      customer = create(:customer)
      @invoices = create_list(:invoice, 10, customer_id: customer.id)

      get "/api/v1/invoices/find_all?customer_id=#{@invoices.first.customer_id}"
      expect(response).to be_success
      found_invoices = JSON.parse(response.body)

      expect(found_invoices.count).to eq(10)

      found_invoices.each_with_index do |found_invoice, i|
        expect(found_invoice['id']).to eq(@invoices[i].id)
      end
    end
  end
end