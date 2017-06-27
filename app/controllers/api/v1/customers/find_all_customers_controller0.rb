class Api::V1::Customers::FindAllCustomersController < ApplicationController

  def index
    customers = Customer.where(find_params)
    render json: customers
  end

  def find_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end