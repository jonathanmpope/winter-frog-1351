class PlantPlot < ApplicationRecord
    belongs_to :plant
    belongs_to :plot

    def self.find_item(data)
        where("plant_id = ? AND plot_id = ?", data[:plant_id], data[:plot_id])
    end 
end 