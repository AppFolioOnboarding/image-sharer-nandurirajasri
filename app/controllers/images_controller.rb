class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params.require(:image).permit(:url))
    if @image.save
      flash[:success] = 'Successfully saved Image Link!'
      redirect_to @image
    else
      flash.now[:error] = 'Unable to save Image Link!'
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Invalid id!'
    redirect_to images_path
  end

  def index
    @images = Image.all
  end
end
