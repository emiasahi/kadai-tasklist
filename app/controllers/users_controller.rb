class UsersController < ApplicationController
  def new
    # newはUserの作成ページなので、ログインしていなくてもアクセスできないとまずい
    @user = User.new
  end

  def create
    # newはUserの作成実行なので、ログインしていなくてもアクセスできないとまずい
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to login_url
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
