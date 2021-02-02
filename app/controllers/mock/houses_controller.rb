class Mock::HousesController < ApplicationController

    def index
        @mock_houses = MockHouse.all
    end
    
    def new
        
    end
    
    def create 
        params.permit!
        @mock_house = MockHouse.new(params[:mock_houses])

        if @mock_house.save
            redirect_to "/mock/houses"
            return 
        else
            render "error"
        end  
    end
    
    private
    
    def house_params
        params.require(:mock_houses).permit(:address, :price, :year_built, :beds, :baths, :sqft, :hoa_fee, :last_tax_amount, :main_picture, :url, :rent_estimate, :rank_score)
    end    
end
