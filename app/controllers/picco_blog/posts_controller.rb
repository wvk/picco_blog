require_dependency "picco_blog/application_controller"

module PiccoBlog
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :set_recent_posts, only: [:index, :show]
    before_action :set_tags_all, except: [:create, :update, :destroy]
    before_action :authenticate, except: [:index, :show]

    # GET /posts
    def index
      if current_user
        posts_scope = Post.visible
      else
        posts_scope = Post
      end
      posts_scope = posts_scope.order('id desc')

      if params[:tag].present?
        posts_scope = posts_scope.tagged_with(params[:tag])
      end

      if params[:search].present?
        posts_scope = posts_scope.search(params[:search])
      end

      @posts = posts_scope.page params[:page]
      @title = "Blog"
    end

    # GET /posts/1
    def show
      if request.path != post_path(@post)
        redirect_to @post, status: :moved_permanently
      end

      @title = @post.title
      @meta_description = @post.excerpt.truncate(300).strip
    end

    # GET /posts/new
    def new
      @post = Post.new
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts
    def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to @post, notice: t('.created')
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update post_params
        redirect_to @post, notice: t('.updated')
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to posts_url, notice: t('.destroyed')
    end

    private

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def set_recent_posts
      @recent_posts = Post.visible.last(PiccoBlog.recent_posts).reverse
    end

    def set_tags_all
      @available_tags = ActsAsTaggableOn::Tagging.includes(:tag).where(context: 'tags').collect { |tagging| tagging.tag.name.to_s }.uniq
    end

    def authenticate
      redirect_to root_url unless eval(PiccoBlog.current_user).send(PiccoBlog.authenticate)
    end

    def post_params
      params.require(:post).permit(:title, :text, :author_id, :tag_list, :excerpt, :state, :members_only, :featured_image)
    end
  end
end
