class Api::V1::Items::FindAllItemsController < ApplicationController

  def index
    merchant = Item.where(find_params)
    render json: merchant
  end

  def find_params
    params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at)
  end
end