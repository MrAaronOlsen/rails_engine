class Api::V1::Merchants::TopRevenueController < ApplicationController

  def index
    render json: Merchant, date: params[:date], serializer: RevenueByDateSerializer
  end
end