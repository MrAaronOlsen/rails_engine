class Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    invoice = InvoiceItem.find_by(find_params)
    render json: invoice
  end

  def find_params
    params.permit(:id, :quantity, :unit_price,
                  :item_id, :invoice_id, :created_at, :updated_at)
  end
end