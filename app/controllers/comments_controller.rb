class CommentsController < ApplicationController

	def create
    @parent = Post.find(params[:post_id]) if params[:post_id]
    @parent ||= Category.find(params[:category_id])
    @comment = @parent.comments.create(comment_params)
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :content)
    end
end