class Api::V1::Customers::CustTransactionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    render json: customer.transactions
  end

end