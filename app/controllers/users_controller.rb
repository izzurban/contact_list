class UsersController < ApplicationController

    before_action :require_logged_in_user, only: [:show, :edit, :update]
  
    def new
      
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = 'Cadastro realizado com sucesso'
        redirect_to root_url
      else
        render 'new'
      end
    end
  
    def edit
    end
  
    
  
    private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
  
  end
  