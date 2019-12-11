class SignupController < ApplicationController

  def step1
    @user = User.new
    @user.build_user_profile
  end

  def step2

  end

  def step3

  end

  def step4

  end

  def done

  end

  def create
      @user = User.new(user_params)
      @user.build_user_profile(user_params[:user_profile_attributes])
      # binding.pry
    if @user.save
      @user.save
      redirect_to user_accounts_path
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
      :year_of_birth,
      :month_of_birth,
      :day_of_birth,
      :phone_number,
      user_profile_attributes: [:id, :nickname, :avator, :profile]
    )
  end

end
