class AuthController < ApplicationController
  include ActionController::Cookies

  skip_before_action :set_current_user, only: [:create]

  def create
    r = User.login(
      login_params[:email],
      login_params[:password]
    )

    if !r.success?
      err_res(r.errs, :not_found)
      return
    end

    cookies[:session_id] = r.data.session_id
    render json: {}, status: :ok
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
