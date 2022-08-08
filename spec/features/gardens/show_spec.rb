require 'rails_helper'

RSpec.describe 'garden show page' do 
    it 'has a list of all the plants in that garden' do
        garden1 = Garden.create!(name:"Pete's Fresh Things", organic:true)

        plot1 = Plot.create!(number:10, size:"medium", direction:"North", garden_id:garden1.id)
        plot2 = Plot.create!(number:5, size:"small", direction:"South", garden_id:garden1.id)
        plot3 = Plot.create!(number:20, size:"large", direction:"East", garden_id:garden1.id)

        plant1= Plant.create!(name:"SunFlower", description:"a large annual forb of the genus Helianthus grown as a crop for its edible oil and seeds", days_to_harvest:30)
        plant2= Plant.create!(name:"Rose", description:"a woody perennial flowering plant of the genus Rosa", days_to_harvest:45)
        plant3= Plant.create!(name:"Prickly Pear", description:"a genus of flowering plants in the cactus family Cactaceae", days_to_harvest:180)
        
        PlantPlot.create!(plant:plant1, plot:plot1)
        PlantPlot.create!(plant:plant2, plot:plot1)
        PlantPlot.create!(plant:plant3, plot:plot1)
        PlantPlot.create!(plant:plant3, plot:plot2)
        PlantPlot.create!(plant:plant2, plot:plot2)
        PlantPlot.create!(plant:plant3, plot:plot3)

        visit "/gardens/#{garden1.id}"

        expect(page).to have_content("SunFlower", count: 1)
        expect(page).to have_content("Rose", count: 1)
        expect(page).to_not have_content("Prickly Pear")
    end 
end 