class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def colorgy
    auth = request.env['omniauth.auth']

    @user = User.from_colorgy(auth)

    if @user.persisted?
      set_flash_message(:notice, :success, kind: 'Colorgy') if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.colorgy_data'] = auth
      redirect_to new_user_registration_path
    end
  end

  def after_omniauth_failure_path_for(scope)
    root_path
  end
end
