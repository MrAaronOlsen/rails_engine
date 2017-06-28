class Api::V1::Items::FindItemController < ApplicationController

  def index
    item = Item.find_by(find_params)
    render json: item
  end

  def find_params
    params.permit( :id, :name, :description, :unit_price,
                   :merchant_id, :created_at, :updated_at )
  end
end