class Mock::SnapshotsController < ApplicationController
    def new
        
    end
    
    def create
        params.permit!
        @mock_snapshot = MockSnapshot.new(params[:mock_snapshots])

        @mock_snapshot.save
    end    

    private
    
    def snapshot_params
        params.require(:mock_snapshots).permit(:value)
    end 
end
