class GameOfLife
  attr_reader :initial_matrix, :next_matrix

  def initialize(matrix)
    @initial_matrix = matrix
    @next_matrix = matrix
  end

  def check_top(x, y)
    initial_matrix[x-1][y] == 1
  end

  def check_top_right(x, y)
    initial_matrix[x - 1][y + 1] == 1
  end

  def check_right(x, y)
    initial_matrix[x][y + 1] == 1
  end

  def check_bottom_right(x, y)
    initial_matrix[x+1][y + 1] == 1
  end

  def check_bottom(x, y)
    initial_matrix[x + 1][y] == 1
  end

  def check_bottom_left(x, y)
    initial_matrix[x + 1][y - 1] == 1
  end

  def check_left(x, y)
    initial_matrix[x][y - 1] == 1
  end

  def check_top_left(x, y)
    initial_matrix[x - 1][y - 1] == 1
  end

  def check_num_alive(x, y)
    [check_top(x,y), check_top_right(x, y), check_right(x, y),
      check_bottom_right(x,y), check_bottom(x,y), check_bottom_left(x,y),
      check_left(x, y), check_top_left(x, y)].count(true)
  end

  def check_num_dead(x, y)
    8 - check_num_alive(x, y)
  end

  def determine_fate(x, y)
    if initial_matrix[x][y] == 1 && check_num_alive(x, y) < 2
      @next_matrix[x][y] = 0
    elsif initial_matrix[x][y] == 1 && check_num_alive(x, y) <= 3
      @next_matrix[x][y] = 1
    elsif initial_matrix[x][y] == 1 && check_num_alive(x, y) > 3
      @next_matrix[x][y] = 0
    elsif initial_matrix[x][y] == 0 && check_num_alive(x, y) == 3
      @next_matrix[x][y] = 1
    end
  end

end
