class Users::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    build_resource
    @user = User.new(user_params)

    if resource.save
      set_flash_message :notice, :signed_up if is_navigational_format?
      sign_up(resource_name, resource)
      respond_to do |format|
        format.html { redirect_to root_path }
      end

    else
      clean_up_passwords resource
      @error_fields = resource.errors.messages
      respond_to do |format|
        format.js { render :action => :new }
        format.html { render :action => :new }
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :provider, :password_confirmation)
  end
end