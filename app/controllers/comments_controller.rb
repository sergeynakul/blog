class CommentsController < ApplicationController

	def create
    @parent = Category.find(params[:category_id]) if params[:category_id]
    @parent ||= Post.find(params[:post_id])
    @comment = @parent.comments.build(comment_params)
    @comment.save
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :content)
    end
end