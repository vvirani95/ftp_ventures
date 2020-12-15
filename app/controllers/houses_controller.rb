class HousesController < ApplicationController

    def index
        if user_signed_in?
            @houses = House.all
        else
            redirect_to '/'
        end 
    end
    
    def new
        if !user_signed_in?
            redirect_to '/'
        end 
    end
    
    def create 
        params.permit!
        @house = House.new(params[:houses])

        if @house.save
            redirect_to "/houses"
            return 
        else
            render "error"
        end  
    end
    
    private
    
    def house_params
        params.require(:houses).permit(:address, :price, :year_built, :beds, :baths, :sqft, :hoa_fee, :last_tax_amount, :main_picture, :url, :rent_estimate, :rank_score)
    end    
end
