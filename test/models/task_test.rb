require "test_helper"

class TaskTest < ActiveSupport::TestCase

  test "category association" do
    @category = Category.create(name: "Personal")
    @task = Task.create(category_id: @category.id)

    assert_equal @task.category, @category
  end

  test "check if values are not nil" do
    @task = Task.new
    assert_equal @task.save, false
  end

  test "check if category_id exist" do
    @task = Task.create(name: "Task", description: "Task Description", deadline: "2022-01-01")
    assert_not @task.save
  end
  
end
