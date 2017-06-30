class Api::V1::Invoices::FindController < ApplicationController

  def index
    invoice = Invoice.find_by(find_params)
    render json: invoice
  end

  def find_params
    params.permit(:id, :status, :customer_id,
                  :merchant_id, :created_at, :updated_at)
  end
end