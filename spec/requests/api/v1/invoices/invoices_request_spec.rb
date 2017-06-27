require 'rails_helper'

describe 'Invoices API' do

  context 'Basic get requests'
    it 'sends list of all invoices' do
      create_list(:invoice, 3)

      get '/api/v1/invoices'
      expect(response).to be_success
      raw_invoices = JSON.parse(response.body)

      expect(raw_invoices.count).to eq(3)
      expect(raw_invoices.first).to have_key('customer_id')
      expect(raw_invoices.first).to have_key('merchant_id')
      expect(raw_invoices.first).to have_key('status')
      expect(raw_invoices.first).to have_key('created_at')
      expect(raw_invoices.first).to have_key('updated_at')
    end

    it 'shows an invoice' do
      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}"
      expect(response).to be_success
      raw_invoice = JSON.parse(response.body)

      expect(raw_invoice['customer_id']).to eq(invoice.customer_id)
      expect(raw_invoice['merchant_id']).to eq(invoice.merchant_id)
      expect(raw_invoice['status']).to eq(invoice.status)
      expect(raw_invoice['created_at']).to eq(invoice.created_at)
      expect(raw_invoice['updated_at']).to eq(invoice.updated_at)
    end
  end
end