class BoardController < ApplicationController
  layout 'board'

  def index
    @people = Person.all
  end
end
