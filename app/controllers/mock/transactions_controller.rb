class Mock::TransactionsController < ApplicationController
    def index
        @mock_transactions = MockTransaction.all
    end    

    def new 
        @mock_transaction = MockTransaction.new
    end    

    def create
        @mock_transaction = MockTransaction.new(mock_transaction_params)

        if @mock_transaction.save
            redirect_to "/mock/transactions"
        else
            render "error"
        end        
    end

    private 

    def mock_transaction_params
        params.require(:mock_transactions).permit(:transaction_description, :value, :transaction_type)
    end  
end
