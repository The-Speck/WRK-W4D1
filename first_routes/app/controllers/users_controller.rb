class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    users = User.all
    render json: users
  end
  
  def create
    user = User.new(user_params) 
    
    if user.save
      render json: user_params
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    user = User.find(params[:id])
    
    render json: user
  end
  
  def update
    user = User.find(params[:id]) 
    
    if user.update(user_params)
      render json: user_params
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end 
  
  def destroy 
    user = User.find(params[:id]) 
    
    user.destroy
    render json: { message: 'User has been annihilated' }
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end