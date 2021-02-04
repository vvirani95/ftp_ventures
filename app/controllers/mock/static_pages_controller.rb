class Mock::StaticPagesController < ApplicationController
    def welcome
        render "welcome"
    end    

    def portal 
        @value = mock_individual_value()
        
        if mock_total_value() == 0
            @total_value = 1
        else    
            @total_value = mock_total_value()
        end
        @last = MockSnapshot.last
        @snaps = MockSnapshot.all
        render "portal"
    end     

    def events
        
        render "events-calendar"
    
    end    

    def transactions
        render "transactions"
    end    

    def test
    
    end    

    def links
        render 'links'       
    end    
  
end
