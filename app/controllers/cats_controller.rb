class CatsController < ApplicationController
    def show
       @cat = Cat.new
       @cat = Cat.find(params[:id])
       @user = @cat.user
      end
    
      def index
        @user = current_user
        @cat = Cat.new
        @cats = Cat.all
      end
    
      def create
        @cat = Cat.new(cat_params) 
        @cat.user_id = current_user.id 
        if @cat.save
          flash[:notice] = "Successfully posted"
          redirect_to book_path(@cat)
        else
          @user = current_user
          @cats = Cat.all
          render :index
        end
      end
      
      def edit  
      @cat = Cat.find(params[:id])
       if @cat.user == current_user
            render "edit"
        else
          redirect_to cats_path
        end
      end
      
      def update
        @cat = Cat.find(params[:id])
        if @cat.update(cat_params)
          flash[:notice] = "Successfully updated."
          redirect_to book_path(@cat)
        else
          if @cat.errors[:title].include?("can't be blank")
            flash[:alert] = "Title can't be blank"
        else
          flash[:alert] = "Update failed. Please check the error."
        end
          render :edit
        end
      end
      
      def destroy
      @cat = Cat.find(params[:id])
      if @cat.destroy
        flash[:notice]="Successfully destroyed."
        redirect_to cats_path
      end
    end
      
      private
      def cat_params
      params.require(:cat).permit(:title, :body)
      end   
   end
