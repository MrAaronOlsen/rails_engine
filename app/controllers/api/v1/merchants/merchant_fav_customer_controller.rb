class Api::V1::Merchants::MerchantFavCustomerController < ApplicationController

  def index
    merchant = Merchant.find(params[:merchant_id])

    render json: merchant.favorite_customer_for.first
  end
end