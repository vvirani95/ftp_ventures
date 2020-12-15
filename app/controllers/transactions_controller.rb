class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.where("transactions.user_id = #{current_user.id}", transaction_type: "All Members")
    end    

    def new 
        @transaction = Transaction.new
    end    

    def create
        @transaction = Transaction.new(transaction_params)

        if @transaction.save
            redirect_to "/transactions"
        else
            render "error"
        end        
    end

    private 

    def transaction_params
        params.require(:transactions).permit(:transaction_description, :value, :transaction_type, :user_id)
    end  
end
