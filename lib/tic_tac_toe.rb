class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2], #Top row
    [3, 4, 5], #Middle row
    [6, 7, 8], #Bottom row
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, player)
    @board[index] = player
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true 
    else 
      return false 
    end
  end
  
  def turn
    puts "Please choose a number 1-9"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      turn
    end
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def won?
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    pos_1 = @board[index_0]
    pos_2 = @board[index_1]
    pos_3 = @board[index_2]

    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      return win_combo
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      return win_combo
    end
  }
  return false
end
  
  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end 
  
  def draw?
    if !won? && full?
      return true
    else 
      return false
    end
  end 
  
  def over?
    if won? || draw? || full?
      return true
    else 
      return false
    end
  end 
  
  def winner
    index = won?
    if index == false
      return nil
    elsif @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
  
  def play
  until over?
    turn
  end
  if draw?
    puts "Cat's Game!"
  elsif won?
    puts "Congratulations #{winner}!"
  else

  end
end
end
