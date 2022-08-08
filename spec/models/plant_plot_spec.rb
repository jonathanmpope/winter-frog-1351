require 'rails_helper'

RSpec.describe PlantPlot, type: :model do
  describe 'relationships' do
    it {should belong_to :plant}
    it {should belong_to :plot}
  end

   describe 'class methods' do
    it 'returns a specific plant plot object' do  
      garden1 = Garden.create!(name:"Pete's Fresh Things", organic:true)

      plot1 = Plot.create!(number:10, size:"medium", direction:"North", garden_id:garden1.id)
      plot2 = Plot.create!(number:5, size:"small", direction:"South", garden_id:garden1.id)
      plot3 = Plot.create!(number:20, size:"large", direction:"East", garden_id:garden1.id)

      plant1= Plant.create!(name:"SunFlower", description:"a large annual forb of the genus Helianthus grown as a crop for its edible oil and seeds", days_to_harvest:30)
      plant2= Plant.create!(name:"Rose", description:"a woody perennial flowering plant of the genus Rosa", days_to_harvest:45)
      plant3= Plant.create!(name:"Prickly Pear", description:"a genus of flowering plants in the cactus family Cactaceae", days_to_harvest:180)
      
      pp1 = PlantPlot.create!(plant:plant1, plot:plot1)
      pp2 = PlantPlot.create!(plant:plant2, plot:plot1)
      pp3 = PlantPlot.create!(plant:plant3, plot:plot1)
      pp4 = PlantPlot.create!(plant:plant3, plot:plot2)
      pp5 = PlantPlot.create!(plant:plant2, plot:plot2)
      pp6 = PlantPlot.create!(plant:plant3, plot:plot3)

      data = {:plant_id=>"#{plant1.id}", :plot_id=>"#{plot1.id}"}
      expect(PlantPlot.find_item(data)[0]).to eq(pp1)
    end 
  end 
end
