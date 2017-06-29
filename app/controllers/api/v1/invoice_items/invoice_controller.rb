class Api::V1::InvoiceItems::InvoiceController < ApplicationController

  def index
    invoice_item = InvoiceItem.find(params[:invoice_item_id])
    render json: invoice_item.invoice
  end
end