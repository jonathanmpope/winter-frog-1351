class PlantPlotsController < ApplicationController

    def destroy
        PlantPlot.find_item(params)[0].destroy 
        redirect_to "/plots"
    end 

end 