class MoodsController < ApplicationController
  layout 'board', only: [:index]

  def index
    @users = User.users_with_moods
    @moods = @users.map { |user| user.current_mood }
  end

  def show
    user = User.friendly.find(params[:user_slug])
    mood = user.moods.find(params[:id])

    redirect_to(edit_user_mood_path(user, mood))
  end

  def edit
    @user = User.friendly.find(params[:user_slug])
    @mood = @user.moods.find(params[:id])
  end

  def create
    user = User.friendly.find(params[:user_slug])

    mood = user.moods.new
    mood.left = params[:mood][:left]
    mood.top = params[:mood][:top]
    mood.save!

    respond_to do |format|
      format.html do
        redirect_to(user_mood_path(user, mood))
      end

      format.json do
        render json: {}
      end
    end
  end
end
