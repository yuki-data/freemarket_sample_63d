class SignupController < ApplicationController
  protect_from_forgery

  

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
