class BoardsController < ApplicationController

  def create 
    @board = current_user.boards.create(board_params)
    if @board.save
      flash[:success] = "Board Created!"
      redirect_to @board
    else
      @board_items = []
      render 'static_pages/home'
    end
  end

  def show
    @board = Board.find(params[:id])
    @users = @board.users
    @lists = @board.task_lists
  end
  

  private

  def board_params
    params.require(:board).permit( :name, :description)
  end
end
