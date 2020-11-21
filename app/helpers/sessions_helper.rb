module SessionsHelper
  def current_user
    if session[:hello].present?
    @user ||= User.find_by(email: session[:hello]) #如果有就給他，沒有就再撈一次
    else
      nil
    end
  end
end