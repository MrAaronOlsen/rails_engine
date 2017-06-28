class Api::V1::Merchants::MerchantRevenueController < ApplicationController

  def index
    merchant = Merchant.find(params[:merchant_id])

    if params[:date]
      render json: { revenue: merchant.total_revenue_by_date_for(params[:date]) }
    else
      render json: { revenue: merchant.total_revenue_for }
    end
  end
end