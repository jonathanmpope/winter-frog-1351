class Garden < ApplicationRecord
  has_many :plots

  def uniq_plants_less_hundred_out
    plots.joins(:plants).distinct
    .where('days_to_harvest < 100')
    .select('plants.*')
  end 
end
