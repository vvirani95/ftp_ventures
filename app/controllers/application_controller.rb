class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
   
    def after_sign_in_path_for(resource)
        '/home'
    end    

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
    end    

    def total_value
        value = 0
        @transactions = Transaction.all
        @transactions.each do |transaction|
            value += transaction.value
        end    
        
        return value
    end    

    def individual_value
        value = 0
        @transactions = Transaction.where("transactions.user_id = #{current_user.id}", transaction_type: "All Members")
        @transactions.each do |transaction|
            value += transaction.value
        end    

        return value
    end       

    def mock_individual_value
        value = 0
        @transactions = MockTransaction.all
        @transactions.each do |transaction|
            value += transaction.value
        end    

        return value
    end 
end
