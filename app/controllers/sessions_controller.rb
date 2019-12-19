class SessionsController < ApplicationController
  skip_before_action :require_login 

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:todos)
    else
      flash.now[:danger] = 'ログイン失敗'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to url_for(action: :new)
  end
end
