require_dependency "picco_blog/application_controller"

module PiccoBlog
  class ImagesController < ApplicationController
    before_action :set_image, only: [:show, :edit, :update, :destroy]
    before_action :authenticate, except: [:show]

    def index
      images_scope = Image.order('id desc')

      @images = images_scope.page params[:page]
    end

    # GET /images/1
    def show
    end

    # GET /images/new
    def new
      @image = Image.new
    end

    # GET /images/1/edit
    def edit
    end

    # POST /images
    def create
      @image = Image.new(image_params)

      if @image.save
        redirect_to back_or_default(images_path), notice: t('.created')
      else
        render :new
      end
    end

    # PATCH/PUT /images/1
    def update
      if @image.update image_params
        redirect_to @image, notice: t('.updated')
      else
        render :edit
      end
    end

    # DELETE /images/1
    def destroy
      @image.destroy
      redirect_to images_url, notice: t('.destroyed')
    end

    private

    def set_image
      @image = Image.friendly.find(params[:id])
    end

    def authenticate
      redirect_to root_url unless eval(PiccoBlog.current_user).send(PiccoBlog.authenticate)
    end

    def image_params
      params.require(:image).permit(:name, :description, :author_id, :image)
    end
  end
end
