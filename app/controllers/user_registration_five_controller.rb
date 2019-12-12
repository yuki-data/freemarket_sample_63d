class UserRegistrationFiveController < ApplicationController
  def new
   @address = Prefecture.all
   #https://tenlife123.com/programing/how-use-active-hash/
  end
end
