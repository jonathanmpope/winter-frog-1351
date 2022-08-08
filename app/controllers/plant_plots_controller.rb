class PlantPlotsController < ApplicationController

    def destroy
        plant_plot = PlantPlot.find_item(params)[0]
        plant_plot.destroy 
        redirect_to "/plots"
    end 

end 