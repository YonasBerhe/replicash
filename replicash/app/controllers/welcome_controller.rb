class WelcomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :handle_token] #,:ensure_signup_complete

   def index
     if current_user
       Rails.logger.debug("coupon = #{session[:coupon]}")
       if session[:coupon].present?
         @coupon,@remaining = Coupon.redeem(code: session[:coupon], user: current_user)
         # session.delete(:coupon)
         Tweet.new(user: current_user).update(@coupon,@remaining)
         # render 'has_coupon' and return unless @coupon.nil?
       end
     else
       render 'home/index' and return
     end
   end
   
   def handle_token
     Rails.logger.debug("params = #{params.inspect}\nSESSION = #{session[:coupon]}")
     if params[:coupon].present?
       if current_user
         session[:coupon] = params[:coupon]
         redirect_to root_path() and return
       else
         redirect_to user_omniauth_authorize_path(provider: :twitter,coupon: params[:coupon]) and return
       end
     else
       redirect_to root_path() and return
     end
   end


   # GET/PATCH /users/:id/finish_signup
   def finish_signup
     # authorize! :update, @user 
     if request.patch? && params[:user] #&& params[:user][:email]
       if @user.update(user_params)
         @user.skip_reconfirmation!
         sign_in(@user, :bypass => true)
         redirect_to @user, notice: 'Your profile was successfully updated.'
       else
         @show_errors = true
       end
     end
   end
   
   private
   def user_params
     accessible = [ :name, :email ] # extend with your own params
     accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
     params.require(:user).permit(accessible)
   end
        
end
