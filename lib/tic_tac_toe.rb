require 'pry'
class TicTacToe
    attr_accessor :board
    WIN_COMBINATIONS = [
        [0, 1, 2], #top row
        [3, 4, 5], #middle row
        [6, 7, 8], #bottom row
        [0, 3, 6], #left column
        [1, 4, 7], #middle column
        [2, 5, 8], #right column
        [0, 4, 8], #diagonal
        [2, 4, 6] #diagonal
    ]
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(input)
        integer = input.to_i 
        integer - 1
    end

    def move (spot, piece)
        board[spot] = piece
    end

    def position_taken?(index)
        board[index] != " " ? true : false
    end

    def valid_move?(index)
        !position_taken?(index) && [*0..8].include?(index)
    end

    def turn_count
        count = 0 
        board.map do |str|
            if str == "O" || str == "X"
                count += 1
            end
        end
        count
    end

    def current_player
        turn_count.odd? ? "O" : "X"
    end


   
end


# describe '#turn' do
#     let(:game) { TicTacToe.new }

#     it 'receives user input via the gets method' do
#       allow($stdout).to receive(:puts)
#       expect(game).to receive(:gets).and_return("1")

#       game.turn
#     end

#     it "calls #input_to_index, #valid_move?, and #current_player" do
#       allow($stdout).to receive(:puts)
#       expect(game).to receive(:gets).and_return("5")
#       expect(game).to receive(:input_to_index).and_return(4)
#       expect(game).to receive(:valid_move?).and_return(true)
#       expect(game).to receive(:current_player).and_return("X")

#       game.turn
#     end

#     it 'makes valid moves and displays the board' do
#       allow($stdout).to receive(:puts)
#       expect(game).to receive(:gets).and_return("1")
#       expect(game).to receive(:display_board)

#       game.turn

#       board = game.instance_variable_get(:@board)
#       expect(board).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])
#     end

#     it 'asks for input again after a failed validation' do
#       game = TicTacToe.new
#       allow($stdout).to receive(:puts)

#       expect(game).to receive(:gets).and_return("invalid")
#       expect(game).to receive(:gets).and_return("1")

#       game.turn
#     end
#   end