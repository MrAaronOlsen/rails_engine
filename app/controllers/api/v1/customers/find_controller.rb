class Api::V1::Customers::FindController < ApplicationController

  def index
    customer = Customer.find_by(find_params)
    render json: customer
  end

  def find_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end