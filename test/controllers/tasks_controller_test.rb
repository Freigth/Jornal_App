require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index" do
    @category = Category.create(name: "some category")
    
    get category_tasks_path(@category.id)
    assert_response :success
  end

  test "should create a task" do
    @category = Category.create(name: "some category")

    post category_tasks_path(@category.id), params: {"task": {"name": "Task Name", "description": "Task Description", "deadline": "2022-01-01", "category_id": @category.id}}
    assert_response :redirect
  end

  test "should delete a task" do
    @category = Category.create(name: "some category")
    @task = Task.create(name: "Task Name", description: "Task Description", deadline: "2022-01-01", category_id: @category.id)

    delete category_task_path(@category.id, @task.id)
    assert_response :redirect
  end

  test "should update a task" do
    @category = Category.create(name: "some category")
    @task = Task.create(name: "Task Name", description: "Task Description", deadline: "2022-01-01", category_id: @category.id)

    patch category_task_path(@category.id, @task.id), params: {"task": {"name": "Task Name Updated", "description": "Task Description", "deadline": "2022-01-01", "category_id": @category.id}}
    assert_response :redirect
  end

  test "should not save when nil" do
    @task = Task.new

    assert_not @task.save
  end

  test "should have a new route" do
    @category = Category.create(name: "some category")

    get new_category_task_path(@category.id)
    assert_response :success
  end

  test "should throw error when task is empty" do
    @category = Category.create(name: "some category")

    post category_tasks_path(@category.id), params: {"task": {"name": "", "description": "", "deadline": "", "category_id": @category.id}}
    assert_response :unprocessable_entity
  end

  test "should throw error when update is invalid" do
    @category = Category.create(name: "some category")
    @task = Task.create(name: "Task Name", description: "Task Description", deadline: "2022-01-01", category_id: @category.id)

    patch category_task_path(@category.id, @task.id), params: {"task": {"name": "", "description": "", "deadline": "2022-01-01", "category_id": @category.id}}
    assert_response :unprocessable_entity
  end

  test "should have edit" do
    @category = Category.create(name: "some category")
    @task = Task.create(name: "Task Name", description: "Task Description", deadline: "2022-01-01", category_id: @category.id)

    get edit_category_task_path(@category.id, @task.id)
    assert_response :success
  end

end
