require 'rails_helper'

describe 'Transactions API' do

  context 'user wants to get transactions' do
    it 'gets list of all transactions' do
      create_list(:transaction, 3)

      get '/api/v1/transactions'
      expect(response).to be_success
      raw_transactions = JSON.parse(response.body)

      expect(raw_transactions.count).to eq(3)
      expect(raw_transactions.first).to have_key('invoice_id')
      expect(raw_transactions.first).to have_key('credit_card_number')
      expect(raw_transactions.first).to have_key('result')
      expect(raw_transactions.first).not_to have_key('created_at')
      expect(raw_transactions.first).not_to have_key('updated_at')
    end

    it 'gets a transaction' do
      transaction = create(:transaction)

      get "/api/v1/transactions/#{transaction.id}"
      expect(response).to be_success
      raw_transaction = JSON.parse(response.body)

      expect(raw_transaction['invoice_id']).to eq(transaction.invoice_id)
      expect(raw_transaction['credit_card_number']).to eq(transaction.credit_card_number)
      expect(raw_transaction['result']).to eq(transaction.result)
    end
  end

  context 'user wants to find an transaction' do
    before do
      @transaction = create_list(:transaction, 10).first
    end

    it 'finds transaction by id' do
      get "/api/v1/transactions/find?id=#{@transaction.id}"
      expect(response).to be_success
      found_transaction = JSON.parse(response.body)

      expect(@transaction.id).to eq(found_transaction['id'])
    end

    it 'finds transaction by credit_card_number' do
      get "/api/v1/transactions/find?credit_card_number=#{@transaction.credit_card_number}"
      expect(response).to be_success
      found_transaction = JSON.parse(response.body)

      expect(@transaction.id).to eq(found_transaction['id'])
    end

    it 'finds transaction by result' do
      get "/api/v1/transactions/find?result=#{@transaction.result}"
      expect(response).to be_success
      found_transaction = JSON.parse(response.body)

      expect(@transaction.id).to eq(found_transaction['id'])
    end

    it 'finds transaction by invoice_id' do
      get "/api/v1/transactions/find?invoice_id=#{@transaction.invoice_id}"
      expect(response).to be_success
      found_transaction = JSON.parse(response.body)

      expect(@transaction.id).to eq(found_transaction['id'])
    end

    it 'finds transaction by created_at' do
      get "/api/v1/transactions/find?created_at=#{@transaction.created_at}"
      expect(response).to be_success
      found_transaction = JSON.parse(response.body)

      expect(@transaction.id).to eq(found_transaction['id'])
    end

    it 'finds transaction by updated_at' do
      get "/api/v1/transactions/find?updated_at=#{@transaction.updated_at}"
      expect(response).to be_success
      found_transaction = JSON.parse(response.body)

      expect(@transaction.id).to eq(found_transaction['id'])
    end
  end

  context 'user wants to find transactions' do
    before do
      @transactions = create_list(:transaction, 10)
    end

    it 'finds all transactions by id' do
      transactions = create_list(:transaction, 1)

      get "/api/v1/transactions/find_all?id=#{transactions.first.id}"
      expect(response).to be_success
      found_transactions = JSON.parse(response.body)

      expect(found_transactions.count).to eq(1)

      found_transactions.each_with_index do |found_transaction, i|
        expect(found_transaction['id']).to eq(transactions[i].id)
      end
    end

    it 'finds all transactions by credit_card_number' do

      get "/api/v1/transactions/find_all?credit_card_number=#{@transactions.first.credit_card_number}"
      expect(response).to be_success
      found_transactions = JSON.parse(response.body)

      expect(found_transactions.count).to eq(10)

      found_transactions.each_with_index do |found_transaction, i|
        expect(found_transaction['id']).to eq(@transactions[i].id)
      end
    end

    it 'finds all transactions by result' do
      get "/api/v1/transactions/find_all?result=#{@transactions.first.result}"
      expect(response).to be_success
      found_transactions = JSON.parse(response.body)

      expect(found_transactions.count).to eq(10)

      found_transactions.each_with_index do |found_transaction, i|
        expect(found_transaction['id']).to eq(@transactions[i].id)
      end
    end

    it 'finds all transactions by invoice_id' do
      invoice = create(:invoice)
      @transactions = create_list(:transaction, 10, invoice_id: invoice.id)

      get "/api/v1/transactions/find_all?invoice_id=#{@transactions.first.invoice_id}"
      expect(response).to be_success
      found_transactions = JSON.parse(response.body)

      expect(found_transactions.count).to eq(10)

      found_transactions.each_with_index do |found_transaction, i|
        expect(found_transaction['id']).to eq(@transactions[i].id)
      end
    end
  end
end