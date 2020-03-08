class UsersController < ApplicationController

	before_action :authenticate_user!

	def show
		#@user = User.find(current_user.id)
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books
	end

	def edit
		@user = User.find(params[:id])
		if current_user != @user
			redirect_to user_path(current_user)
		end
	end

	def index
		@user = User.find(current_user.id)
		@book = Book.new
		@users = User.all
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		redirect_to user_path(@user.id), notice: "You have updated user successfully."
	else
		render :edit
	end
	end

	def aurhenticate_user
		if session[:user.id] == nil
			ridirect_to ("new_user_session_path")
		end
	end


	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end


end


