class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: Merchant.revenue(search_params[:date])
  end

  def search_params
    params.permit(:date)
  end
end