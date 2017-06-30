class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    if @instance_options[:date]
      object.total_revenue_by_date_for(@instance_options[:date])
    else
      object.total_revenue_for
    end
  end
end