class Garden < ApplicationRecord
  has_many :plots

  def uniq_plants_less_hundred_out
    plots.joins(:plants)
    .where('days_to_harvest < 100')
    .select('plants.*, count(plants.id) as count')
    .group('plants.id')
    .order('count desc')
  end 
end
