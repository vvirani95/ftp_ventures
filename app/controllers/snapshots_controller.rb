class SnapshotsController < ApplicationController
    def new
        if !user_signed_in?
            redirect_to '/'
        end 
    end
    
    def create
        params.permit!
        @snapshot = Snapshot.new(params[:snapshots])

        @snapshot.save
    end    

    private
    
    def snapshot_params
        params.require(:snapshots).permit(:user_id, :value)
    end 
end
