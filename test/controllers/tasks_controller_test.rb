require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index" do
    @category = Category.create(name: "some category")

    get category_tasks_path(@category.id)
    assert_response :success
  end


  test "should create a category" do
    @category = Category.create(name: "some category")

    post category_tasks_path(@category.id), params: {"task": {"name": "Task Name", "description": "Task Description", "deadline": "2022-01-01", "category_id": @category.id}}
    assert_response :redirect
  end

  test "should not save when nil" do
    @task = Task.new

    assert_not @task.save
  end

end
