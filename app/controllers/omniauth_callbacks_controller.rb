class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    oauth_data = request.env["omniauth.auth"]
    @user = User.find_by_facebook_uid(oauth_data['uid']) 

    if @user 
      sign_in @user
      redirect_to root_url, notice: "Signed in!"  
    else
      @user = User.find_by_email(oauth_data['info']['email']) 

      if @user
        @user.facebook_uid = oauth_data['uid']
        @user.save
        redirect_to root_url, notice: "Successfully linked your Facebook Account && Signed in!"  
      else
        @user = User.new
        @user.facebook_uid = oauth_data['uid']
        @user.email = oauth_data['info']['email'] 
        render 'registrations/new_from_facebook'
      end
    end
  end

end  