class Api::V1::Merchants::MerchantRevenueController < ApplicationController

  def index
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant, date: params[:date], serializer: MerchantRevenueSerializer
  end
end