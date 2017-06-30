class Api::V1::InvoiceItems::FindAllController < ApplicationController

  def index
    invoice_items = InvoiceItem.where(find_params)
    render json: invoice_items
  end

  def find_params
    params.permit(:id, :quantity, :unit_price,
                  :item_id, :invoice_id, :created_at, :updated_at)
  end
end