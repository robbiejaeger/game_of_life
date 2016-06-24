require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game_of_life'

class GameOfLifeTest < Minitest::Test

  def test_it_sets_up_game_correctly
    initial_matrix = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)
    assert_equal initial_matrix, game.initial_matrix
    assert_equal initial_matrix, game.next_matrix
  end

  def test_can_check_if_top_neighbor_is_alive
    initial_matrix = [[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    assert_equal true, game.check_top(1,0)
  end

  def test_can_check_if_top_right_neighbor_is_alive
    initial_matrix = [[0, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    assert_equal true, game.check_top_right(1,0)
  end

  def test_can_check_if_right_neighbor_is_alive
    initial_matrix = [[0, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    assert_equal true, game.check_right(0,0)
  end

  def test_can_check_if_bottom_right_neighbor_is_alive
    initial_matrix = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    assert_equal true, game.check_bottom_right(1,0)
  end

  def test_can_check_if_bottom_neighbor_is_alive
    initial_matrix = [[0, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    assert_equal true, game.check_bottom(0,0)
  end

  def test_can_check_if_bottom_left_neighbor_is_alive
    initial_matrix = [[0, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    assert_equal true, game.check_bottom_left(0,1)
  end

  def test_can_check_if_left_neighbor_is_alive
    initial_matrix = [[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    assert_equal true, game.check_left(0,1)
  end

  def test_can_check_if_top_left_neighbor_is_alive
    initial_matrix = [[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    assert_equal true, game.check_top_left(1,1)
  end

  def test_can_get_num_alive
    initial_matrix = [[1, 1, 0, 0], [0, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    assert_equal 3, game.check_num_alive(1,1)
  end

  def test_can_get_num_alive
    initial_matrix = [[1, 1, 0, 0], [0, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    assert_equal 5, game.check_num_dead(1,1)
  end

  def test_live_cell_with_fewer_than_two_live_neigbors_dies
    initial_matrix = [[0, 0, 0, 0], [0, 1, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    game.determine_fate(1,1)

    assert_equal 0, game.next_matrix[1][1]
  end

  def test_live_cell_with_two__or_three_live_neigbors_lives
    initial_matrix = [[0, 1, 0, 0], [0, 1, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    game.determine_fate(1,1)

    assert_equal 1, game.next_matrix[1][1]
  end

  def test_live_cell_with_more_than_three_live_neigbors_dies
    initial_matrix = [[0, 1, 0, 0], [1, 1, 0, 0], [1, 1, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    game.determine_fate(1,1)

    assert_equal 0, game.next_matrix[1][1]
  end

  def test_dead_cell_with_three_live_neigbors_becomes_alive
    initial_matrix = [[0, 1, 0, 0], [0, 0, 0, 0], [1, 1, 0, 0], [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    game.determine_fate(1,1)

    assert_equal 1, game.next_matrix[1][1]
  end

  def test_can_determine_multiple_fates
    skip
    initial_matrix = [[0, 1, 0, 0],
                      [0, 0, 0, 0],
                      [1, 1, 1, 0],
                      [0, 0, 0, 0]]
    game = GameOfLife.new(initial_matrix)

    game.play(1)

    result_matrix = [[0, 0, 0, 0],
                     [0, 0, 0, 0],
                     [0, 1, 0, 0],
                     [0, 0, 0, 0]]

    assert_equal result_matrix, game.next_matrix
  end
end
