class TagController < ApplicationController

  def index
    @tags = Tag.all
    render :index
  end

  def new
    @tag = Tag.new
    render :new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag has been added!"
      redirect_to photo_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    flash[:notice] = "User successfully edited!"
    render :edit
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def update
    @user= User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User successfully updated!"
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User successfully destroyed!"
    redirect_to users_path
  end