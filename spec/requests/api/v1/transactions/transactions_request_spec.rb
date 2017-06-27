require 'rails_helper'

describe 'Transactions API' do

  context 'Basic get requests'
    it 'sends list of all transactions' do
      create_list(:transaction, 3)

      get '/api/v1/transactions'
      expect(response).to be_success
      raw_transactions = JSON.parse(response.body)

      expect(raw_transactions.count).to eq(3)
      expect(raw_transactions.first).to have_key('transaction_id')
      expect(raw_transactions.first).to have_key('credit_card_number')
      expect(raw_transactions.first).to have_key('result')
      expect(raw_transactions.first).to have_key('created_at')
      expect(raw_transactions.first).to have_key('updated_at')
    end

    it 'shows a transaction' do
      transaction = create(:transaction)

      get "/api/v1/transactions/#{transaction.id}"
      expect(response).to be_success
      raw_transaction = JSON.parse(response.body)

      expect(raw_transaction['transaction_id']).to eq(transaction.transaction_id)
      expect(raw_transaction['credit_card_number']).to eq(transaction.credit_card_number)
      expect(raw_transaction['result']).to eq(transaction.result)
      expect(raw_transaction['created_at']).to eq(transaction.created_at)
      expect(raw_transaction['updated_at']).to eq(transaction.updated_at)
    end
  end
end