require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    test "should get index" do
        get categories_path
        assert_response :success
    end

    test "should show category" do
        get category_path(1)
        assert_response :success
    end

    test "should create a category" do
        post categories_path, params: {"category": {"name": "Personal"}}
        assert_response :redirect
    end

    test "should not save without name" do
        @category = Category.new
        assert_not @category.save
    end

    test "should delete a category" do
        @category = Category.create(name: "Personal")

        delete category_path(@category.id)
        assert_response :redirect
    end

    test "should update a category" do
        @category = Category.create(name: "Personal")
        
        patch category_path(@category.id), params: {"category": {"name": "Personal Updated"}}
        assert_response :redirect
    end

    test "should have an edit route" do
        @category = Category.create(name: "Personal")

        get edit_category_path(@category.id)
        assert_response :success
    end

    test "should throw error when invalid" do
        post categories_path, params: {"category": {"name": ""}}

        assert_response :unprocessable_entity
    end

    test "should throw when error on update" do
        @category = Category.create(name: "Personal")

        patch category_path(@category.id), params: {"category": {"name": ""}}
        assert_response :redirect
    end


end