class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @cat = Cat.new
        @cats = @user.cats
    end 
        
      def index   
        @user = current_user
        @users = User.all
        @cat = Cat.new
        @cats = Cat.all
      end
    
      def new
        @user = User.new
        @post_image = @user.post_images
      end
    
      def create
        @user = User.new(user_params)
        if @user.save
          @post_image = @user.post_images.create(post_image_params)
          flash[:notice] = "User was successfully created."
          redirect_to @user
        else
          render :new
        end
      end
    
      def edit
        @user = User.find(params[:id])
        if @user != current_user
           redirect_to user_path(current_user)
        end
      end  
      
      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:notice]="You have updated user successfully."
          redirect_to user_path(current_user)
        else
          render :edit
        end
      end
    
      private
      def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
      end  

      def post_image_params
        params.require(:post_image).permit(:image) 
      end
end
