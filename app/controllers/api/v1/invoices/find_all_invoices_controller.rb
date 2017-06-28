class Api::V1::Invoices::FindAllInvoicesController < ApplicationController

  def index
    invoices = Invoice.where(find_params)
    render json: invoices
  end

  def find_params
    params.permit(:id, :status, :customer_id,
                  :merchant_id, :created_at, :updated_at)
  end
end