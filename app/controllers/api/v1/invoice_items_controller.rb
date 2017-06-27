class Api::V1::InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItem.all
  end

  def show
    invoice_item = InvoiceItem.find(params[:id])
    render json: invoice_item
  end

end