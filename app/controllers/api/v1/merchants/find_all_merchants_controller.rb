class Api::V1::Merchants::FindAllMerchantsController < ApplicationController

  def index
    merchant = Merchant.where(find_params)
    render json: merchant
  end

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end