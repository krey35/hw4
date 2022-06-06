class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @current_user # @user or @current_user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome, #{@user["id"]}." #or "username"
        redirect_to "/places" 
      else
        flash["notice"] = "Nope."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Try Again."
      redirect_to "/login"
    end
  end

  def destroy
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/login"
  end
end

  