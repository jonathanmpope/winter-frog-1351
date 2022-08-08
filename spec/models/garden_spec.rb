require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'instance methods' do
    it 'returns only a unique list of garden plants with less than 100 days to harvest' do  
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

      
      expect(garden1.uniq_plants_less_hundred_out[0].name).to eq("Rose")
      expect(garden1.uniq_plants_less_hundred_out[0].days_to_harvest).to eq(45)
      expect(garden1.uniq_plants_less_hundred_out[1].name).to eq("SunFlower")
      expect(garden1.uniq_plants_less_hundred_out[1].days_to_harvest).to eq(30)
    end 
  end 
end
