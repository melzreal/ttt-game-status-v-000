# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end


def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  (full?(board) && !won?(board))
end

def over?(board)
  (full?(board)||won?(board)||draw?(board))
end

def winner(board)
#if the index returned by won includes all X then x won and vice versa
    index = won?(board)

    if board[index]==["X","X","X"]
      return "X"
    elsif board[index]==["O","O","O"]
      return "O"
    else
      return nil
    end
end
