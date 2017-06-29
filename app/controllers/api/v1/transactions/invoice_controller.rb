class Api::V1::Transactions::InvoiceController < ApplicationController

  def index
    transaction = Transaction.find(params[:transaction_id])
    render json: transaction.invoice
  end
end