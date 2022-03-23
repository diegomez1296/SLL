# Tic Tac Toe - Łukasz Rydziński
board=(1 2 3 4 5 6 7 8 9)
player_X="X"
player_O="O"
round=0

is_game=true

start_message() {
  clear
  echo "Tic Tac Toe - Łukasz Rydziński"
  echo ""
}

show_board() {
  clear
  echo " ${board[0]} | ${board[1]} | ${board[2]} "
  echo "-----------"
  echo " ${board[3]} | ${board[4]} | ${board[5]} "
  echo "-----------"
  echo " ${board[6]} | ${board[7]} | ${board[8]} "
  echo ""
}

player_round(){
  if [[ $(($round % 2)) -eq 0 ]]
  then
    play=$player_X
    echo -n "X: (choose number) "
  else
    echo -n "O: (choose number) "
    play=$player_O
  fi

  read number

  space=${board[($number -1)]} 

  if [[ ! $number =~ ^-?[0-9]+$ ]] || [[ ! $space =~ ^[0-9]+$  ]]
  then 
    echo "Not a valid number."
    player_round
  else
    board[($number -1)]=$play
    ((round=round+1))
  fi
  space=${board[($number-1)]} 
}

check_board() {
  if  [[ ${board[$1]} == ${board[$2]} ]]&& [[ ${board[$2]} == ${board[$3]} ]]; then
    is_game=false
  fi
  if [ $is_game == false ]; then
    if [ ${board[$1]} == 'x' ];then
      echo "Winner: O"
      return 
    else
      echo "Winner: X"
      return 
    fi
  fi
}

check_winner(){
  if [ $is_game == false ]; then return; fi
  check_board 0 1 2
  if [ $is_game == false ]; then return; fi
  check_board 3 4 5
  if [ $is_game == false ]; then return; fi
  check_board 6 7 8
  if [ $is_game == false ]; then return; fi
  check_board 0 4 8
  if [ $is_game == false ]; then return; fi
  check_board 2 4 6
  if [ $is_game == false ]; then return; fi
  check_board 0 3 6
  if [ $is_game == false ]; then return; fi
  check_board 1 4 7
  if [ $is_game == false ]; then return; fi
  check_board 2 5 8
  if [ $is_game == false ]; then return; fi

  if [ $round -gt 8 ]; then 
    echo "Draw!"
	is_game=false
	return
  fi
}

start_message
show_board
while $is_game
do
  player_round
  show_board
  check_winner
done