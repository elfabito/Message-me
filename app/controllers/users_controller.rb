class UsersController < ApplicationController

  before_action :set_user, only:[:show, :edit, :update, :destroy]
  before_action :require_user, only:[:edit, :update]
  before_action :require_same_user, only:[:edit, :update, :destroy]

    def show

    end

    def index
      @user = User.all
    end

    def new
      @user = User.new
    end

    def edit

    end

   def create
     @user = User.new(params_user)
     if @user.save
       session[:user_id] = @user.id
       flash[:notice] = "Welcome to Message me, you have successfully Sign Up"
       redirect_to root_path
     else
       render 'new'
   end
  end

    def update

      if @user.update(params_user)
        flash[:notice] = "Your account information was updated successfully"
        redirect_to @user
      else
        render 'edit'
      end
    end

     def destroy

      @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:notice] = "Account and all associated articles successfully deleted"
      redirect_to root_path

     end


  private

    def params_user
      params.require(:user).permit(:username,:password)
    end

    def set_user
    @user = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own account"
      end
    end
  end
end
