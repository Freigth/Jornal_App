require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(email: 'test@email.com', password: 'password')
    @category = Category.create(name: "some category", user_id: @user.id)
  end
  
  test "should get index" do
    
    get category_tasks_path(@category.id)
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

  test "should update a task" do
    @task = Task.create(name: "Task Name", description: "Task Description", deadline: "2022-01-01", category_id: @category.id)

    patch category_task_path(@category.id, @task.id), params: {"task": {"name": "Task Name Updated", "description": "Task Description", "deadline": "2022-01-01", "category_id": @category.id}}
    assert_response :redirect
  end

  test "should not save when nil" do
    @task = Task.new

    assert_not @task.save
  end

  test "should have a new route" do

    get new_category_task_path(@category.id)
    assert_response :success
  end

  test "should throw error when task is empty" do

    post category_tasks_path(@category.id), params: {"task": {"name": "", "description": "", "deadline": "", "category_id": @category.id}}
    assert_response :unprocessable_entity
  end

  test "should throw error when update is invalid" do
    @task = Task.create(name: "Task Name", description: "Task Description", deadline: "2022-01-01", category_id: @category.id)

    patch category_task_path(@category.id, @task.id), params: {"task": {"name": "", "description": "", "deadline": "2022-01-01", "category_id": @category.id}}
    assert_response :unprocessable_entity
  end

  test "should have edit" do
    @category = Category.create(name: "some category", user_id: @user.id)
    @task = Task.create(name: "Task Name", description: "Task Description", deadline: "2022-01-01", category_id: @category.id)

    get edit_category_task_path(@category.id, @task.id)
    assert_response :success
  end

end
