class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    render json: customer.fav_merchant.first
  end
end