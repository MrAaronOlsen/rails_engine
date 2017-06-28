class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    render json: Merchant.most_revenue(search_params[:quantity])
  end

  def search_params
    params.permit(:quantity)
  end
end