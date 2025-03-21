class PostimagesController < ApplicationController
    def new
        @post_image = PostImage.new
      end
    
      def create
        @post_image = PostImage.new(post_image_params)
        @post_image.user_id = current_user.id
      if @post_image.save
        redirect_to post_images_path
      else
        render :new
       end
      end
    
      def index
        @post_images = PostImage.page(params[:page])
      end
    
      def show
        @post_image = PostImage.find(parmas[:id])
      end
    
      def destroy
        post_image = PostImage.find(parmars[:id])
        post_image.destroy
        redirect_to post_images_path
      end
    
      private
    
      def post_image_params
        params.require(:post_image).permit(:image,)
      end
    
end
