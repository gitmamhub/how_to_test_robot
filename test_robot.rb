require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    foreign_robot = Robot.new
    foreign_robot.needs_repairs = (true)
    foreign_robot.foreign_model = (true)
    # act

    repairs = foreign_robot.station

    # assert
    assert_equal(1,repairs)

  end



  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    vintage_robot = Robot.new
    vintage_robot.needs_repairs = (true)
    vintage_robot.vintage_model = (true)
    # act

    repairs = vintage_robot.station

    # assert
    assert_equal(2,repairs)


  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    standard_robot = Robot.new
    standard_robot.needs_repairs = (true)

    # act

    repairs = standard_robot.station

    # assert
    assert_equal(3,repairs)


  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    good_robot = Robot.new
    # good_robot.needs_repairs = (false)

    # act

    repairs = good_robot.station

    # assert
    assert_equal(4,repairs)

  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
    robot = Robot.new
    # act
    value = robot.prioritize_tasks
    # assert
    assert_equal(-1, value)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
    robot = Robot.new
    robot.todos = [1]
    # act
    value = robot.prioritize_tasks
    # assert
    assert_equal(1,value)
  end

  def test_workday_on_day_off_returns_false

    # arrange
    robot = Robot.new
    robot.day_off = 'sunday'
    # act
    value = robot.workday?'sunday'
    # assert
    assert_same(false, value)
  end

  def test_workday_not_day_off_returns_true

    # arrange
    robot = Robot.new
    robot.day_off = 'sunday'
    # act
     value = robot.workday?('wednesday')
    # assert
    assert_equal(true,value)
  end

end
