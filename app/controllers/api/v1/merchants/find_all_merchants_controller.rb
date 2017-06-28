class Api::V1::Merchants::FindAllMerchantsController < ApplicationController

  def index
    merchants = Merchant.where(find_params)
    render json: merchants
  end

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end