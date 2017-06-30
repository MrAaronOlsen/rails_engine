class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: Merchant, date: params[:date],
                            all: true, serializer: TotalRevenueSerializer
  end

  def show
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant, date: params[:date], serializer: RevenueSerializer
  end
end