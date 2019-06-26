class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params.require(:image).permit(:url, :tag_list))
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
    @images = Image.all.order('created_at DESC')
  end

  def tagged
    @images = if params[:tag].present?
                images = Image.tagged_with(params[:tag])
                flash[:warning] = 'No images found for the specified tag!' if images.count < 1
                images
              else
                Image.all
              end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:deleted] = 'Image has been deleted successfully'
    redirect_to images_path
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Image could not be deleted. Either the image doesn\'t exist or try again later'
    redirect_to images_path
  end
end
