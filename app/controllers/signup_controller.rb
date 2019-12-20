class SignupController < ApplicationController
  protect_from_forgery

  def step1
    @user = User.new
    @user.build_user_profile
  end

  def step2
    session[:nickname] = user_params[:user_profile_attributes]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name] = user_params[:first_name]
    session[:first_name_kana] = user_params[:first_name_kana]
    #データ型をここで加工する
    year = params[:user]["birth_day(1i)"]
    month = params[:user]["birth_day(2i)"]
    day = params[:user]["birth_day(3i)"]
    params[:user][:birth_day] = "#{year}-#{month}-#{day}"
    session[:birth_day] = user_params[:birth_day]
    @user = User.new
  end

  def step3
    binding.pry
  end

  def new
    @user = User.new
    @user.build_user_profile
    @user.build_user_address
  end

  def create
      @user = User.new(user_params)
      @user.build_user_profile(user_params[:user_profile_attributes])
      @user.build_user_address(user_params[:user_address_attributes])
    if @user.save
      sign_in(User.find(@user.id), scope: :user) unless user_signed_in?
      redirect_to root_path
    else
      redirect_to root_path
    end
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
      :birth_day,
      :phone_number,
      user_profile_attributes: [
        :id,
        :nickname
      ],
      user_address_attributes: [
        :id,
        :first_name,
        :first_name_kana,
        :last_name,
        :last_name_kana,
        :post_number,
        :prefecture,
        :city,
        :house_number,
        :building_name,
        :phone_number
      ]
    )
  end
end
