class BoardsController < ApplicationController

  def index
  end
  
  def new
    @board = board.new
  end

  def create
    clean_params = params.require(:board).permit(:title) #過濾資料指定欄位

    @board = Board.new(clean_params) #產生實體init接資料指定給@board

    if @board.save #如果資料正確就寫入資料

    redirect_to "/" , notice '成功新增看板'

    else
      render :new #render 'boards/new'
    end
  end
end
