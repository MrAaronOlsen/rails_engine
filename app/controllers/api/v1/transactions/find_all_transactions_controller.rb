class Api::V1::Transactions::FindAllTransactionsController < ApplicationController

  def index
    transactions = Transaction.where(find_params)
    render json: transactions
  end

  def find_params
    params.permit( :id, :credit_card_number, :result,
                   :invoice_id, :created_at, :updated_at )
  end
end