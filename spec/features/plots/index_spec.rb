require 'rails_helper'

RSpec.describe 'plots index page' do 
    it 'has all the plot and its plants info' do
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

        visit "/plots"

          within ("#plots") do 
            expect(page.all('.plot')[0]).to have_content(10)
            expect(page.all('.plot')[0]).to have_content("SunFlower")
            expect(page.all('.plot')[0]).to have_content("Rose")
            expect(page.all('.plot')[0]).to have_content("Prickly Pear")
            expect(page.all('.plot')[1]).to have_content(5)
            expect(page.all('.plot')[1]).to_not have_content("SunFlower")
            expect(page.all('.plot')[1]).to have_content("Rose")
            expect(page.all('.plot')[1]).to have_content("Prickly Pear")
            expect(page.all('.plot')[2]).to have_content(20)
            expect(page.all('.plot')[2]).to_not have_content("SunFlower")
            expect(page.all('.plot')[2]).to_not have_content("Rose")
            expect(page.all('.plot')[2]).to have_content("Prickly Pear")
            expect(page).to have_css('.plot', count: 3)
        end 
    end 

    it 'has a button to delete a plant' do
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

        visit "/plots"

        within (page.all('.plot')[0]) do
            expect(page).to have_button("Delete Rose")
            click_button("Delete Rose")
            expect(current_path).to eq("/plots")
        end

        within (page.all('.plot')[0]) do
            expect(page).to_not have_content("Delete Rose")
            expect(page).to_not have_content("Rose")
        end         
        
        within (page.all('.plot')[1]) do
            expect(page).to have_button("Delete Prickly Pear")
            expect(page).to have_button("Delete Rose")
            expect(page).to_not have_content("Delete Sunflower")
        end
    end 
end 