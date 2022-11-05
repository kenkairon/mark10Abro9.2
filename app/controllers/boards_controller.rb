class BoardsController < ApplicationController
    before_action :authenticate_user!
    def index 
      @boards = Board.all
    end
    def show
    end

    def new
      @board = Board.new
    end

    def create
      publication = Publication.find(params[:board][:publication_id])
      board = publication.boards.build(board_params)
      board.user = current_user
    
      if board.save
        redirect_to board.publication
      end
    end

    def update
      publication = Publication.find(params[:board][:publication_id])
      board = publication.boards.build(board_params)
      board.user = current_user
    
      if board.update
        redirect_to board.publication
      end
    end

    def destroy
      @board.destroy

      respond_to do |format|
        format.html { redirect_to labels_url, notice: "Board was successfully destroyed." }
        format.json { head :no_content }
      end
    end  
    
    private
      def board_params
        params.require(:board).permit(:body)
      end
end

