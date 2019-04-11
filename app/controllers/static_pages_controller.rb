class StaticPagesController < ApplicationController
  
  
  def home
    if logged_in?
      @board  = current_user.boards.build
      @board_items = current_user.boards.paginate(page: params[:page])
    end
  end

  def help
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def contact
  end
  
end
