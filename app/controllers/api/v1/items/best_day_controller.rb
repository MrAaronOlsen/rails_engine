class Api::V1::Items::BestDayController < ApplicationController

  def index
    item = Item.find(params[:item_id])
    render json: { best_day: item.best_day[0].created_at }
  end
end