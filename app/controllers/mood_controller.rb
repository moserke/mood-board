class MoodController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to url_for controller: 'mood'
  end

  def create
    form_data = params[:person]

    @person = Person.new
    @person.name = form_data[:name]
    @person.email = form_data[:email]
    @person.top = 0
    @person.left = 0

    if @person.save
      redirect_to url_for controller: 'mood'
    else
      render 'new'
    end
  end

  def update
    form_data = params[:person]

    @person = Person.find(params[:id])

    @person.name = form_data[:name]
    @person.email = form_data[:email]
    @person.top = form_data[:top]
    @person.left = form_data[:left]

    if @person.save
      redirect_to url_for controller: 'board'
    else
      render 'edit'
    end
  end
end
