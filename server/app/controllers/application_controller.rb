class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :set_current_user

  private

  def set_current_user
    session_id = cookies[:session_id]

    if session_id.nil?
      err_res([], :unauthorized)
      return
    end

    user_id = SessionStorage.get(session_id).data
    if user_id.nil?
      err_res([], :unauthorized)
      return
    end

    user = User.find(user_id)
    if user.nil?
      err_res([], :unauthorized)
      return
    end

    @current_user = user
  end

  def err_res(errs, status)
    render json: {errs: errs}, status: status
  end
end
