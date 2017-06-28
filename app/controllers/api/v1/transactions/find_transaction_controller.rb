class Api::V1::Transactions::FindTransactionController < ApplicationController

  def index
    transaction = Transaction.find_by(find_params)
    render json: transaction
  end

  def find_params
    params.permit( :id, :credit_card_number, :result,
                   :invoice_id, :created_at, :updated_at )
  end
end