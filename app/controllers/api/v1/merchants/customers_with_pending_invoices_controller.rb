class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController

  def index
    merchant = Merchant.find(params[:merchant_id])

    render json: merchant.pending_invoices
  end
end