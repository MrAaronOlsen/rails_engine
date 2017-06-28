class Api::V1::Merchants::MerchantRevenueController < ApplicationController

  def index
    merchant = Merchant.find(params[:merchant_id])
    render json: { revenue: merchant.total_revenue }
  end
end