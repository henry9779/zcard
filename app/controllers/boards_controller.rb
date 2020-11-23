class BoardsController < ApplicationController

  before_action :find_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show

  end
  
  def new
    @board = Board.new
  end

  def edit

  end

  def create
    @board = Board.new(board_params) #產生實體init接資料指定給@board

    if @board.save #如果資料正確就寫入資料

    redirect_to "/" , notice: '成功新增看板'

    else
      render :new #render 'boards/new'
    end
  end

  def update
    if @board.update(board_params)
    redirect_to boards_path, notice: '更新完成'
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path, notice: '看板已刪除'
  end

  private
  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
  clean_params = params.require(:board).permit(:title)
  end
  
end
