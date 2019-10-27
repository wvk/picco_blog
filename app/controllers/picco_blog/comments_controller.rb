require_dependency "picco_blog/application_controller"

module PiccoBlog
  class CommentsController < ApplicationController
    def create
      @post = Post.friendly.find(params[:post_id])
      @comment = @post.comments.create(comment_params)

      redirect_to back_or_default(posts_path), notice: t('.created')
    end

    def destroy
      @post = Post.friendly.find(params[:post_id])
      @post.comments.destroy(params[:id])

      redirect_to back_or_default(posts_path), notice: t('.destroyed')
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end
