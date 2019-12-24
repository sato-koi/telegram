class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to posts_path, notice: "コメントを保存しました。"
    else
      render template: "posts/index"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
