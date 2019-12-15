class SignupController < ApplicationController
  protect_from_forgery
  def step1
    @user = User.new
    @user.build_user_profile
  end

  def signup_test
    @user = User.new
    @user.build_user_profile
  end

  def create
      @user = User.new(user_params)
      @user.build_user_profile(user_params[:user_profile_attributes])
    if @user.save
      # binding.pry
      # mypageを表示できるようにする（ユーザー情報をDBからもってきて、ここのユーザーページ）
      # コントローラ上でリダイレクトじょうけんぶんき
      # user_signed_inしてたら遷移させる
      # 表示確認できたら条件分岐をしてcurrent_user_idとそのmypageのidが一緒か参照させる
      sign_in User.find(@user.id) unless user_signed_in?
      # redirect_to auto_login_signup_index_path
      redirect_to user_accounts_path
    else
      redirect_to root_path
    end
  end

  def auto_login
    # binding.pry
    sign_in User.find(12) unless user_signed_in?
  end

  private
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :first_name,
      :first_name_kana,
      :last_name,
      :last_name_kana,
      :year_of_birth,
      :month_of_birth,
      :day_of_birth,
      :phone_number,
      user_profile_attributes: [:id, :nickname]
    )
  end

end
