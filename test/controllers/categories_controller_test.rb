require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
        @user = users(:user)
        sign_in(@user)
        @category = Category.create(name: "CategoryName", user_id: @user.id)
    end

    test "should get index" do
        get categories_path
        assert_response :success
    end

    test "should show category" do
        get category_path(1)
        assert_response :success
    end

    test "should have an edit route" do
        get edit_category_path(@category.id)
        assert_response :success
    end

    test "should create a category" do
        post categories_path, params: {"category": {"name": "Personal", "user_id": @user.id}}
        assert_response :redirect
    end

    test "should throw error when invalid" do
        post categories_path, params: {"category": {"name": ""}}
        assert_response :unprocessable_entity
    end

    test "should able to create a new category" do
        get new_category_path
        assert_response :success
    end

    test "should delete a category" do
        delete category_path(@category.id)
        assert_response :redirect
    end

    test "should update a category" do  
        patch category_path(@category.id), params: {"category": {"name": "Personal Updated", "user_id": @user.id }}
        assert_response :redirect
    end

    test "should throw when error on update" do
        patch category_path(@category.id), params: {"category": {"name": ""}}
        assert_response :redirect
    end

end