class UsersController < ApplicationController
  def edit
    @user = User.friendly.find(params[:slug])
  end

  def update
    user = User.friendly.find(params[:slug])

    user.email = params[:user][:email]
    user.save!

    flash[:success] = 'Update successful!'
    redirect_to edit_user_path(user)
  end

  def destroy
    user = User.friendly.find(params[:slug])
    user.destroy

    redirect_to(users_path)
  end

  def new
    @user = User.new
  end

  def create
    form_data = params[:user]

    user = User.new
    user.first_name = form_data[:first_name]
    user.last_name = form_data[:last_name]
    user.email = form_data[:email]

    user.save!

    user.moods.create(top: 52, left: 10)

    redirect_to(edit_user_path(user))
  end

  def show
    user = User.friendly.find(params[:slug])

    redirect_to(edit_user_path(user))
  end

  def index
    @users = User.all
  end
end
