class Api::V1::Merchants::TopRevenueController < ApplicationController

  def index
    render json: { total_revenue: Merchant.total_revenue_by_date(search_params[:date]) }
  end

  def search_params
    params.permit(:date)
  end
end