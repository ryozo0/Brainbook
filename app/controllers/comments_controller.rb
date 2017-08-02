class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post
    respond_to do |format|
      if @comment.save
        format.html {redirect_to post_path(@post), notice: 'コメントを投稿しました。'}
        format.js {render :index}
      else
        format.html {render :new}
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post), notice: "編集しました。"
    else
      render 'edit'
      flash[:notice] = "編集できませんでした。"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render 'index'
  end

  private
    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end
end
