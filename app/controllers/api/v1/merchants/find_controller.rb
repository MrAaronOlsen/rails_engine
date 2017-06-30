class Api::V1::Merchants::FindController < ApplicationController

  def index
    merchant = Merchant.find_by(find_params)
    render json: merchant
  end

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end