class PlantPlot < ApplicationRecord
    belongs_to :plant
    belongs_to :plot

    def self.find_item(params)
        where("plant_id = ? AND plot_id = ?", params[:plant_id], params[:plot_id])
    end 
end 