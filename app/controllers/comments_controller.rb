class CommentsController < ApplicationController
  before_action :authorize, except: [:show, :index]

  def index
    @comments = Comment.all
    render :index
  end

  def new
    @photo = Photo.find(params[:photo_id])
    @user = current_user
    @comment = @photo.comments.new
    render :new
  end

  def create
    @user = current_user
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(comment_params)
    if @comment.save
      redirect_to photo_path(@photo)
    else
      flash[:notice] = 'Comment not saved'
      redirect_to photo_path(@photo)
    end
  end
   