require_dependency "picco_blog/application_controller"

module PiccoBlog
  class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)

      flash[:notice] = t('.created')

      redirect_to back_or_default(posts_path)
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end
