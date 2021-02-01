require_dependency "picco_blog/application_controller"

module PiccoBlog
  class CommentsController < ApplicationController
    def create
      @post = Post.friendly.find(params[:post_id])
      @comment = @post.comments.create(comment_create_params)

      redirect_to back_or_default(posts_path), notice: t('.created')
    end

    def destroy
      if params[:post_id]
        scope = Post.friendly.find(params[:post_id])&.comments
      else
        scope = Comment
      end
      scope.destroy(params[:id])

      redirect_to back_or_default(posts_path), notice: t('.destroyed')
    end

    # comment moderation view
    def index
      @comments = Comment.page params[:page]
    end

    def update
      @comment = Comment.find(params[:id])

      if @comment.update(comment_update_params)
        redirect_to back_or_default(@comment.post), notice: t('.updated')
      else
      end
    end

    private

    def comment_update_params
      params.require(:comment).permit(:text, :approved, :email, :parent_id)
    end

    def comment_create_params
      params.require(:comment).permit(:text, :email, :parent_id)
    end
  end
end
