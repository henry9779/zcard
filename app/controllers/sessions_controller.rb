class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.login(params[:user])
      session[:hello] = params[:user][:email]
      # session發cookie給登入者
      redirect_to root_path, notice: '登入成功'
    else
      redirect_to session_path, notice: '登入失敗'
    end
  end

  def destroy
    session[:hello] = nil
    redirect_to root_path, notice: '已登出'
  end

end