class StaticPagesController < ApplicationController
    def welcome
        render "welcome"
    end    

    def portal 
        @value = individual_value()
        @last = Snapshot.where("snapshots.user_id = #{current_user.id}").last
        @snaps = Snapshot.where("snapshots.user_id = #{current_user.id}")
        render "portal"
    end    

    def events
        
        if current_user
            render "events-calendar"
        else
            redirect_to "/"  
        end      
    
    end    

    def transactions
        render "transactions"
    end    

    def test
    
    end    

    def links
        if current_user
            render 'links'
        else
            redirect_to '/'
        end        
    end    
  
end
