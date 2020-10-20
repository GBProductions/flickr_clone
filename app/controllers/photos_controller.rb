class PhotosController < ApplicationController

  def index
    @photos = Photo.all
    if params[:favorite_photo]
      @photo = Photo.find_by_id(params[:favorite_photo])
      @photo.favorited_by current_user
    end
  end

  def new
    @user = User.find(current_user.id)
    @photo = Photo.new
    render :new
  end

  def create
    @user = current_user
    @photo = @user.photos.new(photo_params)
    if @photo.save
      flash[:notice] = "Photo successfully posted!"
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
    @tag = Tag.new
  end

  def edit
    @photo = Photo.find(params[:id])
    flash[:notice] = "Photo successfully edited!"
    render :edit
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:notice] = "Photo successfully updated!"
      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Photo successfully destroyed!"
    redirect_to photos_path
  end


  def favorite
    @photo = Photo.find_by_id(params[:photo_id])
    @photo.favorited_by current_user
    redirect_to photos_path
  end

  private
  def photo_params
  params.require(:photo).permit(:image, :description, :user_id)
  end
end
