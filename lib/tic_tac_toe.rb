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

    def turn
        puts "Make your move. Please enter a position on the board between 1-9"
        position = gets.strip
        index = input_to_index(position)
        if valid_move?(index)
            move(index, current_player)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                return combo
            end
        end
    end

    def full?
        turn_count == 9 ? true : false
    end

    def draw?
        won? == false && full? == true ? true : false
    end

    def over?
        won? || draw?
    end

    def winner
        self.won? ? @board[won?[0]] : nil
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"

    end

end

# describe '#full?' do
#     it 'returns true for a draw' do
#       game = TicTacToe.new
#       board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
#       game.instance_variable_set(:@board, board)

#       expect(game.full?).to be_truthy
#     end

#     it 'returns false for an in-progress game' do
#       game = TicTacToe.new
#       board = ["X", " ", "X", " ", "X", " ", "O", "O", " "]
#       game.instance_variable_set(:@board, board)

#       expect(game.full?).to be_falsey
#     end
#   end