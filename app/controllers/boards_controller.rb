class BoardsController < ApplicationController

  before_action :find_board, only: :show
  before_action :create_valid_board, only: :create

  def index
    @recent_boards = Board.last_ten_records
    @boards = Board.all
  end

  def create
    if @board.save!
      redirect_to @board
    else
      flash[:alert] = "Board creation failed."
      render :index
    end
  end

  def show
    @mines_board = BoardCreator.generate_board(@board.mines, @board.rows, @board.cols) if @board
  end

  private

  def board_params
    params.require(:board).permit(:email, :rows, :cols, :mines)
  end

  def create_valid_board
    @rows, @cols, @mines = board_params.values_at(:rows, :cols, :mines).map(&:to_i)

    if @mines > @rows * @cols
      flash[:alert] = "Mines can't be greater than the total number of cells."
      redirect_back_or_to '/', status: :unprocessable_entity
    end

    mines_location = BoardCreator.place_mines(@rows, @cols, @mines)
    @board = Board.new(email: board_params[:email], rows: @rows, cols: @cols, mines: mines_location)
  end

  def find_board
    @board = Board.find_by(id: params[:id])
  end
end
