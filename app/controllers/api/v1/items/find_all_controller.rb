class Api::V1::Items::FindAllController < ApplicationController

  def index
    items = Item.where(find_params)
    render json: items
  end

  def find_params
    params.permit( :id, :name, :description, :unit_price,
                   :merchant_id, :created_at, :updated_at )
  end
end