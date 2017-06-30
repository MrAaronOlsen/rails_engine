class TotalRevenueSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    object.total_revenue_by_date(@instance_options[:date])
  end
end