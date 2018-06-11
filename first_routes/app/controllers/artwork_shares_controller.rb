class ArtworkSharesController < ApplicationController
  # def index
  #   # render plain: "I'm in the index action!"
  #   artwork_shares = ArtworkShare.all
  #   render json: artwork_shares
  # end
  # 
  def create
    artwork_share = ArtworkShare.new(aws_params) 
  
    if artwork_share.save
      render json: artwork_share.artwork
    else 
      render json: artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  # def show
  #   artwork_share = ArtworkShare.find(params[:id])
  # 
  #   render json: artwork_share
  # end
  # 
  # def update
  #   artwork_share = ArtworkShare.find(params[:id]) 
  # 
  #   if artwork_share.update(aws_params)
  #     render json: aws_params
  #   else 
  #     render json: artwork_share.errors.full_messages, status: :unprocessable_entity
  #   end
  # end 
  # 
  def destroy 
    artwork_share = ArtworkShare.find(params[:id]) 
  
    render json: artwork_share.artwork
    artwork_share.destroy
    
  end 
  
  private
  
  def aws_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
  
end