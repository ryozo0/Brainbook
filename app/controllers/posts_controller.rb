class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @comment = @post.comments.build
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(posts_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
      NoticeMailer.sendmail_post(@post).deliver
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @post.update(posts_params)
      redirect_to posts_path, notice: "編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "削減しました！"
  end

  private
    def posts_params
      params.require(:post).permit(:title, :content)
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
