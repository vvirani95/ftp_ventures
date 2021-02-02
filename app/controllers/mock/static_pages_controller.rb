class Mock::StaticPagesController < ApplicationController
    def welcome
        render "welcome"
    end    

    def portal 
        @value = mock_individual_value()
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
