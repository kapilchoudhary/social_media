class UsersController < ApplicationController
  
  def create
    user = User.new(user_params)

    if user.save
      token = issue_token(user)
      render json: {user: UserSerializer.new(user)}
    else
      if user.errors.messages
        render json: {error: user.errors.messages}
      else
        render json: {error: "User could not be created. Please try again"}
      end
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: {user: UserSerializer.new(user), message: "user has updated"}
    else
      render json: {errors: user.errors.messages}
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
