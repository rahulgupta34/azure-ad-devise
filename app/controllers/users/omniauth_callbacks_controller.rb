class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def passthru
        azure_activedirectory_v2
    end
    
    def azure_activedirectory_v2
        # binding.pry
        # response_params = request.env['omniauth.auth']['info']
        @user = User.find_by!(email: "admin@test.com")
        if @user&.persisted?
            sign_in_and_redirect @user, event: :authentication
        else
            flash[:danger] = 'You have not yet an account!'
            redirect_back(fallback_location: root_path)
        end
    end

end
