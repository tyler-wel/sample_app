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
    store_location
  end
  
  def destroy 
    Board.find(params[:id]).destroy
    flash[:success] = "Board Deleted"
    redirect_to root_path
   end


  private

  def board_params
    params.require(:board).permit( :name, :description)
  end
end
