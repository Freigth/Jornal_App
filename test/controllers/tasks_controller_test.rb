require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user = users(:user)
    sign_in(@user)

    # @category = categories(:category_one)
    # @task = tasks(:task_one)

    @category = Category.create(name: "some category", user_id: @user.id)
    @task = Task.create(name: "task name", description: "task description", deadline: '2022-01-01', category_id: @category.id)
    @overdue = @category.tasks.where("deadline < ?", DateTime.current)
  end
  
  test "should get index" do
    get category_tasks_path(@category.id)
    assert_response :success
  end

  test "should create a new task" do
    get new_category_task_path(@category.id, @task.id)
    assert_response :success
  end

  test "should create a task" do
    post category_tasks_path(@category.id), params: {"task": {"name": "Task Name", "description": "Task Description", "deadline": "2022-01-01", "category_id": @category.id}}
    assert_response :redirect
  end

  test "should delete a task" do
    @task = Task.create(name: "Task Name", description: "Task Description", deadline: "2022-01-01", category_id: @category.id)

    delete category_task_path(@category.id, @task.id)
    assert_response :redirect
  end

  test "should throw error when task is empty" do
    post category_tasks_path(@category.id), params: {"task": {"name": "", "description": "", "deadline": ""}}
    assert_response :unprocessable_entity
  end

  test "should have edit" do
    get edit_category_task_path(@category.id, @task.id)
    assert_response :success
  end

  test "should update a task" do
    patch category_task_path(@category.id, @task.id), params: {"task": {"name": "Task Name Updated"}}
    assert_response :redirect
  end

  test "should throw error when update is invalid" do
    patch category_task_path(@category.id, @task.id), params: {"task": {"name": "", "description": ""}}
    assert_response :unprocessable_entity
  end

  test "should have tasks for today" do
    get tasks_today_path
    assert_response :success
  end

  test "should have overdue tasks" do
    get tasks_overdue_path
    assert_response :success
  end

  test "should show all overdue tasks" do
    get show_overdue_tasks_path(@category.id)
    assert_response :success
  end

end
